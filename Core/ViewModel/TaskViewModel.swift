//
//  TaskViewModel.swift
//  RouteMe
//
//  Created by KsArT on 06.02.2025.
//

import Foundation

open class TaskViewModel: ObservableObject {

    public typealias WorkTaskAsync = (() async -> Void)
    private typealias WorkTask = Task<Void, Never>

    private var tasks: [String: WorkTask] = [:]
    // Добавляем блокировку для потокобезопасности
    private let taskLock = NSLock()

    private var taskNext = 0
    private var taskNameNext: String {
        taskLock.withLock {
            defer { taskNext += 1 }
            return "noName\(taskNext)"
        }
    }

    // MARK: - Запуск асинхронной задачи
    // Запуск асинхронной задачи с именем, отменой предыдущего задания
    final func launch(named taskName: String, cancel: Bool = false, _ operation: @escaping @Sendable WorkTaskAsync) {
        if !cancel && isTask(named: taskName) { return }
        // Отмена предыдущей задачи
        cancelTask(named: taskName)
        // Запуск новой задачи и добавление задачи в словарь
        addTask(named: taskName, task: startTask(named: taskName, operation: operation))
    }

    // Запуск асинхронной задачи без отмены предыдущего задания
    final func launch(_ operation: @escaping @Sendable WorkTaskAsync) {
        launch(named: taskNameNext, operation)
    }
    
    @MainActor
    final func update(_ operation: @escaping @Sendable WorkTaskAsync) async {
        await operation()
    }

    // Отмена всех задач
    open func onCleared() {
        cancelAllTasks()
    }

    // MARK: - Деинициализация ViewModel
    // Отмена всех задач при деинициализации ViewModel
    deinit {
        onCleared()
    }

}

// MARK: - Приватные методы
private extension TaskViewModel {
    
    // Запуск задачи
    private func startTask(named taskName: String, operation: @escaping @Sendable WorkTaskAsync) -> WorkTask {
        Task {
            await withTaskCancellationHandler {
                await operation()
            } onCancel: {
                removeTask(named: taskName)
            }
        }
    }

    private func isTask(named taskName: String) -> Bool {
        tasks[taskName] != nil
    }
    
    // Добавление задачи с именем
    private func addTask(named taskName: String, task: WorkTask) {
        taskLock.withLock { tasks[taskName] = task }
    }

    // Удаление задачи по имени
    private func removeTask(named taskName: String) {
        taskLock.withLock { tasks[taskName] = nil }
    }

    // Отмена предыдущей задачи с таким же именем, если она существует
    private func cancelTask(named taskName: String) {
        taskLock.withLock {
            tasks[taskName]?.cancel()
            tasks[taskName] = nil
        }
    }

    // Отмена всех задач
    private func cancelAllTasks() {
        taskLock.withLock {
            tasks.keys.forEach(cancelTask(named:))
        }
    }
}

// MARK: - Пример запуска задачи
/*
func loadData() {
    launch {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        print("Data loaded")
    }
}
*/
