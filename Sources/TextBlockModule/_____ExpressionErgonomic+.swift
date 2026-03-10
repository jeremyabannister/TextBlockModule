extension ExpressionErgonomic where Self: TextBlockConvertible {
    public func multilineEchoed(as tag: String? = nil) -> Self {
        if let tag = tag {
            print(tag + ": \(self.multilineDescription())")
        } else {
            print(self.multilineDescription())
        }
        return self
    }
}
