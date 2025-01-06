//
//  CategoriesView.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 4/01/25.
//
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var selectedCategory: String? = nil
    //@State private var selectedOption: String? = nil
    @State private var selectedOptions: [String] = []

    var body: some View {
        VStack(spacing: 8) {
            // BCategory buttons
            categoryButtons()

            // options
            if let options = getSelectedCategoryOptions() {
                LazyVStack(alignment: .leading, spacing: 15) {
                    ForEach(splitOptionsIntoRows(options: options, itemsPerRow: 4), id: \.self) { row in
                        HStack(spacing: 9) {
//                            ForEach(Array(row.enumerated()), id: \.offset) { index, option in
//                                optionButton(for: option, id: index)
//                            }
                            ForEach(row, id: \.self) { option in
                                optionButton(for: option)
                            }
                            
                        }
                        
                    }
                }
                .padding(.top, 31)
            }
        }
        .padding()
    }

    // MARK: - Helper Functions

    /// generates category buttons
    private func categoryButtons() -> some View {
        HStack(spacing: 18) {
            ForEach(viewModel.categories, id: \.name) { category in
                Button(category.name) {
                    selectedCategory = category.name
                    selectedOptions = []
                    print("Selected category: \(category.name)")
                }
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(
                    selectedCategory == category.name
                    ? Color.burdeosButton
                    : Color.black.opacity(0.6)
                )
            }
        }
    }

    /// generates an option button
    private func optionButton(for option: String) -> some View {
        Button(action: {
           // selectedOption = "\(option) - \(id)"
            toggleOption(option: option)
            print("Selected option: \(option)")
        }) {
            Text(option)
                .font(.system(size: 15, weight: .regular))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .foregroundStyle(
                    isOptionSelected(option) ? Color.white : Color.black.opacity(0.6)
//                    selectedOption == "\(option) - \(id)" ? Color.white : Color.black.opacity(0.6)
                )
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
//                            selectedOption == "\(option) - \(id)" ? Color.burdeosButton : Color.clear
                            isOptionSelected(option) ? Color.burdeosButton : Color.clear
                        )
                    
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
//                            selectedOption == "\(option) - \(id)" ? Color.burdeosButton : Color.black.opacity(0.4),
//                            lineWidth: 1
                            isOptionSelected(option) ? Color.burdeosButton : Color.black.opacity(0.4), lineWidth: 1
                        )
                )
        }
    }

    /// gets options from the selected category
    private func getSelectedCategoryOptions() -> [String]? {
        guard let selectedCategory = selectedCategory else { return nil }
        return viewModel.categories.first(where: { $0.name == selectedCategory })?.options
    }

    /// splits rows
    private func splitOptionsIntoRows(options: [String], itemsPerRow: Int) -> [[String]] {
        var result: [[String]] = []
        for index in stride(from: 0, to: options.count, by: itemsPerRow) {
            let row = Array(options[index..<min(index + itemsPerRow, options.count)])
            result.append(row)
        }
        return result
    }
    
    private func toggleOption(option: String) {
        if let index = selectedOptions.firstIndex(of: option) {
            selectedOptions.remove(at: index)
        } else {
            selectedOptions.append(option)
        }
        print("Selected Options: \(selectedOptions)")
    }
    
    private func isOptionSelected(_ option: String) -> Bool {
        return selectedOptions.contains(option)
    }
}
    #Preview {
        CategoriesView()
    }
    
