//
//  MVIContainer.swift
//  RouteMe
//
//  Created by KsArT on 06.02.2025.
//

import Foundation
import Combine

/* Контейнер предоставит View доступ к свойствам экрана,
   но не даст изменять их напрямую,  только через Intent */
final class MVIContainer<Intent, Model>: ObservableObject {

    let intent: Intent
    let model: Model

    private var cancellable: Set<AnyCancellable> = []

    /* К сожалению, мы не можете указать тип ObjectWillChangePublisher через 
       дженерики, поэтому укажем его с помощью дополнительного свойства */
    init(intent: Intent, model: Model, _ modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model

        /* Это необходимо для того, чтобы изменения в Model получала View, 
           а не только Container */
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}
