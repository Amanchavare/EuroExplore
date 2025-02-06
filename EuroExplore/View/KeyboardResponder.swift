//
//  KeyboardResponder.swift
//  SwiftfulMapAppExperiment
//
//  Created by Aman Niranjan Chavare on 05/02/25.
//

import Combine
import SwiftUI

class KeyboardResponder: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    
    private var cancellable: AnyCancellable?

    init() {
        cancellable = NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
            .sink { [weak self] notification in
                guard let self = self else { return }
                self.keyboardHeight = self.getKeyboardHeight(from: notification)
            }
    }

    private func getKeyboardHeight(from notification: Notification) -> CGFloat {
        if notification.name == UIResponder.keyboardWillHideNotification {
            return 0
        }
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return 0
        }
        return keyboardFrame.height
    }
}

