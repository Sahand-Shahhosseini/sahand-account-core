\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sahand_q1}[2026/02/09 Sahand Q1 Class v1.6]

% ===== Base =====
\LoadClass[11pt,a4paper]{article}

\RequirePackage{geometry}
\geometry{a4paper,margin=25mm}

% ===== Engine gate =====
\RequirePackage{iftex}
\ifLuaTeX\else
  \ClassError{sahand_q1}{This class requires LuaLaTeX}{Run with lualatex (not pdflatex/xelatex).}
\fi

% ===== Fonts + Language (LuaLaTeX, RTL-safe) =====
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}

% Polyglossia provides proper RTL direction for Persian lines.
\RequirePackage{polyglossia}
\setdefaultlanguage{english}
\setotherlanguage{farsi}

% Helper: choose first existing font from a list (robust CI fallbacks)
\newcommand{\SahandChooseMainFont}{%
  \IfFontExistsTF{Libertinus Serif}{\setmainfont{Libertinus Serif}}{%
  \IfFontExistsTF{LibertinusSerif}{\setmainfont{LibertinusSerif}}{%
  \IfFontExistsTF{Noto Serif}{\setmainfont{Noto Serif}}{%
  \IfFontExistsTF{DejaVu Serif}{\setmainfont{DejaVu Serif}}{%
  \setmainfont{Latin Modern Roman}%
  }}}}%
}

% Persian font selection: define \farsifont (polyglossia expects this)
\newcommand{\SahandChooseFarsiFont}{%
  \IfFontExistsTF{Noto Naskh Arabic}{%
    \newfontfamily\farsifont[Script=Arabic,Language=Persian,Renderer=HarfBuzz]{Noto Naskh Arabic}%
  }{%
  \IfFontExistsTF{Noto Sans Arabic}{%
    \newfontfamily\farsifont[Script=Arabic,Language=Persian,Renderer=HarfBuzz]{Noto Sans Arabic}%
  }{%
  \IfFontExistsTF{Vazirmatn}{%
    \newfontfamily\farsifont[Script=Arabic,Language=Persian,Renderer=HarfBuzz]{Vazirmatn}%
  }{%
  \IfFontExistsTF{Amiri}{%
    \newfontfamily\farsifont[Script=Arabic,Language=Persian,Renderer=HarfBuzz]{Amiri}%
  }{%
    \newfontfamily\farsifont[Script=Arabic,Language=Persian]{DejaVu Sans}%
  }}}}%
}

\SahandChooseMainFont
\SahandChooseFarsiFont

% Math font (unicode-math)
\RequirePackage{unicode-math}
\newcommand{\SahandChooseMathFont}{%
  \IfFontExistsTF{STIX Two Math}{\setmathfont{STIX Two Math}}{%
  \IfFontExistsTF{STIXTwoMath}{\setmathfont{STIXTwoMath}}{%
  \IfFontExistsTF{Latin Modern Math}{\setmathfont{Latin Modern Math}}{%
  % fallback: let unicode-math pick default
  }}}%
}
\SahandChooseMathFont

% Aliases (account-wide convention)
% Use \textfa{...} for short RTL snippets, and \begin{fa}...\end{fa} for paragraphs.
\newcommand{\textfa}[1]{\textfarsi{#1}}
\newenvironment{fa}{\begin{farsi}}{\end{farsi}}

% ===== Core packages =====
\RequirePackage{microtype}
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue,citecolor=blue}

\RequirePackage{amsmath,amsthm}
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
