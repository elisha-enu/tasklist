/// Copyright (c) 2019 ElishaEnu
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Combine

//class TaskStore {
class TaskStore: ObservableObject {
//    @Published var tasks = [
//        "Code",
//        "Sleep",
//        "Bath",
//        "Swimming with the view",
//        "Cooking",
//        "Have a holiday",
//        "Shopping"
//        ].map { Task(name: $0)}
    
       @Published var prioritizedTasks = [
        PrioritizedTasks(
            priority: .no,
            names: [
                "Code",
                "Sleep",
                "Bath"
            ]
        ),
        PrioritizedTasks(
            priority: .low,
            tasks: [
                Task(name: "Swimming with the view"),
            ]
        ),
        PrioritizedTasks(
           priority: .medium,
           tasks: [
                Task(name: "Cooking"),
           ]
       ),
        PrioritizedTasks(
           priority: .high,
           tasks: [
                Task(name: "Have a holiday"),
                Task(name: "Shopping")
           ]
       )
    ]
    
    func getIndex(for priority: Task.Priority) -> Int {
        prioritizedTasks.firstIndex { $0.priority == priority }!
    }
}

extension TaskStore.PrioritizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(
            priority: priority,
            tasks: names.map { Task(name: $0) }
        )
    }
}
