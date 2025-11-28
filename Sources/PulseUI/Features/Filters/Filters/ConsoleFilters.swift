// The MIT License (MIT)
//
// Copyright (c) 2020-2024 Alexander Grebenyuk (github.com/kean).

import Foundation
import Pulse

/// Filter the logs displayed in the console.
public struct ConsoleFilters: Hashable {
    public init() {}
    
    public var shared = Shared()
    public var messages = Messages()
    public var network = Network()

    public struct Shared: Hashable {
        public var sessions = Sessions()
        public var dates = Dates()
    }

    public struct Messages: Hashable {
        public var logLevels = LogLevels()
        public var labels = Labels()
    }

    public struct Network: Hashable {
        public var host = Host()
        public var url = URL()
    }
}

protocol ConsoleFilterProtocol: Hashable {
    init() // Initializes with the default values
}

extension ConsoleFilters {
    public struct Sessions: Hashable, ConsoleFilterProtocol {
        public var selection: Set<UUID> = []
    }

    public struct Dates: Hashable, ConsoleFilterProtocol {
        public var startDate: Date?
        public var endDate: Date?

        public static var today: Dates {
            Dates(startDate: Calendar.current.startOfDay(for: Date()))
        }

        public static var recent: Dates {
            Dates(startDate: Date().addingTimeInterval(-1200))
        }
    }

    public struct LogLevels: ConsoleFilterProtocol {
        public var levels: Set<LoggerStore.Level> = Set(LoggerStore.Level.allCases)
            .subtracting([LoggerStore.Level.trace])
    }

    public struct Labels: ConsoleFilterProtocol {
        public var hidden: Set<String> = []
        public var focused: String?
    }

    public struct Host: ConsoleFilterProtocol {
        public var hidden: Set<String> = []
        public var focused: String?
    }

    public struct URL: ConsoleFilterProtocol {
        public var hidden: Set<String> = []
        public var focused: String?
    }
}
