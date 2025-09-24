# Makefile for LaTeX Resume

# Variables
LATEX_SRC = src/resume.tex
PDF_OUTPUT = resume.pdf
BUILD_DIR = build
DOCS_DIR = docs

# Default target
all: $(PDF_OUTPUT)

# Build the PDF from LaTeX source
$(PDF_OUTPUT): $(LATEX_SRC)
	@echo "Compiling LaTeX resume..."
	@mkdir -p $(BUILD_DIR)
	@cd src && latexmk -pdf -output-directory=../$(BUILD_DIR) -file-line-error -halt-on-error -interaction=nonstopmode resume.tex
	@cp $(BUILD_DIR)/resume.pdf ./$(PDF_OUTPUT)
	@echo "Resume compiled successfully: $(PDF_OUTPUT)"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)
	@rm -f $(PDF_OUTPUT)
	@echo "Clean complete."

# Clean and rebuild
rebuild: clean all

# Create docs directory and copy PDF
docs: $(PDF_OUTPUT)
	@echo "Preparing docs directory..."
	@mkdir -p $(DOCS_DIR)
	@cp $(PDF_OUTPUT) $(DOCS_DIR)/
	@echo "Resume copied to docs directory."

# Serve the docs locally for testing
serve: docs
	@echo "Starting local server at http://localhost:8000"
	@cd $(DOCS_DIR) && python3 -m http.server 8000

# Install LaTeX dependencies (macOS with Homebrew)
install-deps-macos:
	@echo "Installing LaTeX dependencies on macOS..."
	@brew install --cask mactex
	@echo "Please restart your terminal after installation."

# Install LaTeX dependencies (Ubuntu/Debian)
install-deps-ubuntu:
	@echo "Installing LaTeX dependencies on Ubuntu/Debian..."
	@sudo apt-get update
	@sudo apt-get install texlive-full latexmk

# Help target
help:
	@echo "Available targets:"
	@echo "  all              - Build the PDF resume (default)"
	@echo "  clean            - Remove build artifacts"
	@echo "  rebuild          - Clean and rebuild"
	@echo "  docs             - Prepare docs directory with PDF"
	@echo "  serve            - Serve docs locally at http://localhost:8000"
	@echo "  install-deps-macos   - Install LaTeX on macOS"
	@echo "  install-deps-ubuntu  - Install LaTeX on Ubuntu/Debian"
	@echo "  help             - Show this help message"

.PHONY: all clean rebuild docs serve install-deps-macos install-deps-ubuntu help
