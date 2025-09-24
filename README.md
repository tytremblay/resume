# LaTeX Resume with GitHub Pages Deployment

A professional resume built with LaTeX and automatically deployed as a static website using GitHub Actions.

## 🌟 Features

- **Professional LaTeX Resume**: Clean, ATS-friendly resume template
- **Automated Building**: GitHub Actions automatically compiles your LaTeX to PDF
- **Static Site Deployment**: Beautiful web interface to view and download your resume
- **Version Control**: Track changes to your resume over time
- **Mobile Responsive**: Website works great on all devices

## 🚀 Quick Start

### 1. Setup Your Resume

1. **Edit your resume**: Modify `src/resume.tex` with your information
2. **Customize the template**: Adjust styling, sections, and content as needed
3. **Commit your changes**: Push to the main branch

### 2. Enable GitHub Pages

1. Go to your repository settings
2. Navigate to "Pages" in the left sidebar
3. Under "Source", select "GitHub Actions"
4. Your resume will be available at `https://yourusername.github.io/repository-name`

### 3. Automatic Deployment

Every time you push changes to the main branch:
- GitHub Actions compiles your LaTeX resume to PDF
- The static website is updated with the new resume
- Your changes are live within minutes!

## 📁 Repository Structure

```
├── .github/
│   └── workflows/
│       └── build-and-deploy.yml    # GitHub Actions workflow
├── src/
│   └── resume.tex                  # Your LaTeX resume source
├── docs/                          # Generated static site (auto-created)
├── assets/                        # Additional assets (optional)
├── .gitignore                     # Git ignore file
└── README.md                      # This file
```

## ✏️ Editing Your Resume

### Personal Information
Update the header section in `src/resume.tex`:
```latex
\begin{center}
    {\Huge \scshape Your Name} \\ \vspace{1pt}
    123 Your Street, Your City, ST 12345 \\ \vspace{1pt}
    \small \raisebox{-0.1\height}\faPhone\ 123-456-7890 ~ 
    \href{mailto:your.email@example.com}{\raisebox{-0.2\height}\faEnvelope\  \underline{your.email@example.com}} ~ 
    \href{https://linkedin.com/in/yourusername}{\raisebox{-0.2\height}\faLinkedin\ \underline{linkedin.com/in/yourusername}}  ~
    \href{https://github.com/yourusername}{\raisebox{-0.2\height}\faGithub\ \underline{github.com/yourusername}}
    \vspace{-8pt}
\end{center}
```

### Adding Experience
Use the `\resumeSubheading` command for job positions:
```latex
\resumeSubheading
  {Job Title}{Start Date -- End Date}
  {Company Name}{City, State}
  \resumeItemListStart
    \resumeItem{Description of your achievements and responsibilities}
    \resumeItem{Quantified results when possible (e.g., "Improved performance by 25%")}
  \resumeItemListEnd
```

### Adding Projects
Use the `\resumeProjectHeading` command for projects:
```latex
\resumeProjectHeading
    {\textbf{Project Name} $|$ \emph{Technologies Used}}{Year}
    \resumeItemListStart
      \resumeItem{Brief description of what you built}
      \resumeItem{Key technologies and achievements}
    \resumeItemListEnd
```

## 🛠️ Local Development

### Prerequisites
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- Git

### Building Locally
```bash
# Clone the repository
git clone https://github.com/yourusername/resume.git
cd resume

# Compile the LaTeX resume
cd src
pdflatex resume.tex
# or use latexmk for better handling of references
latexmk -pdf resume.tex
```

### Testing the Website Locally
```bash
# Serve the docs folder locally
cd docs
python -m http.server 8000
# Open http://localhost:8000 in your browser
```

## 🎨 Customization

### Styling
- **Colors**: Modify the color scheme in the LaTeX preamble
- **Fonts**: Uncomment different font options in the template
- **Layout**: Adjust margins and spacing using the existing commands

### Website Theme
Edit the CSS in `.github/workflows/build-and-deploy.yml` to customize:
- Color scheme
- Layout
- Typography
- Responsive behavior

## 🔧 Troubleshooting

### LaTeX Compilation Issues
- **Missing packages**: The GitHub Action uses a full LaTeX distribution
- **Font issues**: Stick to standard fonts or add custom font loading
- **Compilation errors**: Check the Actions tab for detailed error logs

### GitHub Pages Issues
- **404 errors**: Ensure GitHub Pages is enabled in repository settings
- **Deployment failures**: Check the Actions tab for build logs
- **PDF not displaying**: Some browsers may block PDF embedding

### Common LaTeX Errors
- **Undefined control sequence**: Usually a missing package or typo
- **Missing $ inserted**: Math mode issue, check for unescaped special characters
- **File not found**: Ensure all referenced files are in the repository

## 📝 Tips for a Great Resume

1. **Keep it concise**: Aim for 1-2 pages maximum
2. **Use action verbs**: Start bullet points with strong action words
3. **Quantify achievements**: Include numbers and percentages when possible
4. **Tailor for ATS**: Use standard section headings and avoid complex formatting
5. **Proofread carefully**: LaTeX makes it easy to maintain consistent formatting

## 🤝 Contributing

Feel free to submit issues and enhancement requests! This template is designed to be:
- Easy to customize
- ATS-friendly
- Professional looking
- Automatically deployable

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- LaTeX resume template inspired by modern CV designs
- GitHub Actions workflow optimized for LaTeX compilation
- Responsive web design for optimal viewing experience

---

**Happy job hunting!** 🎯
