/// The consoleView configuration.
public struct ConsoleConfiguration: Sendable {
    public var mode: ConsoleMode = .all
    
    public var filters: ConsoleFilters = .init()
    
    /// Initializes the default configuration.
    public init() {}
}
