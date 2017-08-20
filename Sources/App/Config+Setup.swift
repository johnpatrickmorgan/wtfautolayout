import LeafProvider

extension Config {
    
    public func setup() throws {

        Node.fuzzy = [JSON.self, Node.self]

        try setupProviders()
    }
    
    private func setupProviders() throws {
        
        try addProvider(LeafProvider.Provider.self)
    }
}
