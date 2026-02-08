\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sahand_q1}[2026/02/08 Sahand Q1 Class v1.3]

% ===== Base =====
\LoadClass[11pt,a4paper]{article}

\RequirePackage{geometry}
\geometry{a4paper,margin=25mm}

% ===== Engine gate =====
\RequirePackage{iftex}
\ifLuaTeX\else
  \ClassError{sahand_q1}{This class requires LuaLaTeX}{Run with lualatex (not pdflatex/xelatex).}
\fi

% ===== Fonts (NO bundled hard paths; robust system fallbacks) =====
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\defaultfontfeatures{Ligatures=TeX}

% Helper: choose first existing font from a list
\newcommand{\SahandChooseMainFont}{%
  \IfFontExistsTF{Libertinus Serif}{\setmainfont{Libertinus Serif}}{%
  \IfFontExistsTF{LibertinusSerif}{\setmainfont{LibertinusSerif}}{%
  \IfFontExistsTF{Noto Serif}{\setmainfont{Noto Serif}}{%
  \IfFontExistsTF{DejaVu Serif}{\setmainfont{DejaVu Serif}}{%
  \setmainfont{Latin Modern Roman}%
  }}}}%
}

\newcommand{\SahandChoosePersianFont}{%
  \IfFontExistsTF{Vazirmatn}{\newfontfamily\persianfont{Vazirmatn}}{%
  \IfFontExistsTF{Noto Naskh Arabic}{\newfontfamily\persianfont{Noto Naskh Arabic}}{%
  \IfFontExistsTF{Noto Sans Arabic}{\newfontfamily\persianfont{Noto Sans Arabic}}{%
  \IfFontExistsTF{Amiri}{\newfontfamily\persianfont{Amiri}}{%
  \newfontfamily\persianfont{DejaVu Sans}%
  }}}}%
}

\newcommand{\SahandChooseMathFont}{%
  \IfFontExistsTF{STIX Two Math}{\setmathfont{STIX Two Math}}{%
  \IfFontExistsTF{STIXTwoMath}{\setmathfont{STIXTwoMath}}{%
  \IfFontExistsTF{Latin Modern Math}{\setmathfont{Latin Modern Math}}{%
  % fallback: let unicode-math pick default
  }}}%
}

\SahandChooseMainFont
\SahandChoosePersianFont
\SahandChooseMathFont

% Persian helper (minimal; for full RTL you can later add bidi/polyglossia)
\newcommand{\textfa}[1]{{\persianfont #1}}

% ===== Core packages =====
\RequirePackage{microtype}
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue,citecolor=blue}

\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{booktabs,tabularx,longtable,array}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{siunitx}

% Charts (required by Contract: at least one figure/table/chart per PDF)
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

% Headers/footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lhead{Sahand Account Canon}
\rhead{\leftmark}
\cfoot{\thepage}

% "Tests & Gates" marker for QA
\newcommand{\TestsAndGatesSection}{\section*{Tests \& Gates}\addcontentsline{toc}{section}{Tests \& Gates}}

% Table column helper
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}

% Optional: make overfull less likely (still audited by QA)
\sloppy
\setlength{\emergencystretch}{2em}
