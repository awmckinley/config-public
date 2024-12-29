{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # downloads your Rust project's dependencies and builds your project
    cargo

    # graph visualization tools
    graphviz

    # next-generation high-performance debugger
    lldb

    # modular compiler frontend for the Rust language
    rust-analyzer

    # safe, concurrent, practical language
    rustc

    # tool for formatting Rust code according to style guidelines
    rustfmt
  ];
}
