\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sahand_q1}[2026/02/07 Sahand Q1 Class v1.2]
\LoadClass[11pt,a4paper]{article}

\RequirePackage{geometry}
\geometry{a4paper,margin=25mm}

\RequirePackage{iftex}
\ifLuaTeX\else
  \ClassError{sahand_q1}{This class requires LuaLaTeX}{Run with lualatex/latexmk configured for lualatex.}
\fi

\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\defaultfontfeatures{Ligatures=TeX}

% --- Bundled fonts ---
% Place font files in STYLEKIT/fonts/ and keep names aligned with these defaults.
\newcommand{\SahandFontPath}{STYLEKIT/fonts/}

\newcommand{\SahandFont}[1]{\SahandFontPath#1}

% Latin text
\setmainfont{\SahandFont{LibertinusSerif-Regular.otf}}[
  BoldFont=\SahandFont{LibertinusSerif-Bold.otf},
  ItalicFont=\SahandFont{LibertinusSerif-Italic.otf},
  BoldItalicFont=\SahandFont{LibertinusSerif-BoldItalic.otf},
]

% Persian/Arabic script (used via \textfa{...})
\newfontfamily\persianfont{\SahandFont{Vazirmatn-Regular.ttf}}[
  BoldFont=\SahandFont{Vazirmatn-Bold.ttf},
]

% Math
\setmathfont{\SahandFont{STIXTwoMath-Regular.otf}}

\RequirePackage{microtype}
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue,citecolor=blue}

\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{booktabs,tabularx,longtable}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{float}

% Headers/footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lhead{Sahand Account Canon}
\rhead{\leftmark}
\cfoot{\thepage}

% A "Tests & Gates" marker for QA
\newcommand{\TestsAndGatesSection}{\section*{Tests \& Gates}\addcontentsline{toc}{section}{Tests \& Gates}}

% Persian helper
\newcommand{\textfa}[1]{{\persianfont #1}}

% Table column helper
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}


% ==== ACCOUNT_CONTENT_LAW: FONT POLICY (FAIL-CLOSED ON LOCAL; CI may fallback) ====
\RequirePackage{iftex}
\ifLuaTeX\else
  \PackageError{sahand_q1}{LuaLaTeX required}{Use lualatex (not pdflatex/xelatex) for this class.}
\fi

\RequirePackage{fontspec}
\RequirePackage{unicode-math}

% Prefer bundled fonts (deterministic). If missing, fall back to system-installed fonts.
\newcommand{\SahandTryMainFont}{%
  \IfFileExists{STYLEKIT/fonts/LibertinusSerif-Regular.otf}{%
    \setmainfont{LibertinusSerif}[
      Path=STYLEKIT/fonts/,
      Extension=.otf,
      UprightFont=LibertinusSerif-Regular,
      BoldFont=LibertinusSerif-Bold,
      ItalicFont=LibertinusSerif-Italic,
      BoldItalicFont=LibertinusSerif-BoldItalic
    ]%
  }{%
    \IfFontExistsTF{Libertinus Serif}{\setmainfont{Libertinus Serif}}{\setmainfont{Latin Modern Roman}}%
  }%
}

\newcommand{\SahandTryMathFont}{%
  \IfFileExists{STYLEKIT/fonts/STIXTwoMath-Regular.otf}{%
    \setmathfont{STIX Two Math}[Path=STYLEKIT/fonts/,Extension=.otf]%
  }{%
    \IfFontExistsTF{STIX Two Math}{\setmathfont{STIX Two Math}}{\setmathfont{Latin Modern Math}}%
  }%
}

% Persian/Arabic font for \textfa{...}
\newfontfamily\persianfont{Vazirmatn}[
  Script=Arabic,
  Scale=1.0
]
\newcommand{\SahandTryPersianFont}{%
  \IfFileExists{STYLEKIT/fonts/Vazirmatn-Regular.ttf}{%
    \renewfontfamily\persianfont{Vazirmatn}[
      Path=STYLEKIT/fonts/,
      Extension=.ttf,
      UprightFont=Vazirmatn-Regular,
      BoldFont=Vazirmatn-Bold,
      Script=Arabic,
      Scale=1.0
    ]%
  }{%
    \IfFontExistsTF{Vazirmatn}{\renewfontfamily\persianfont{Vazirmatn}[Script=Arabic,Scale=1.0]}{%
      \IfFontExistsTF{Noto Naskh Arabic}{\renewfontfamily\persianfont{Noto Naskh Arabic}[Script=Arabic,Scale=1.0]}{%
        \renewfontfamily\persianfont{Amiri}[Script=Arabic,Scale=1.0]%
      }%
    }%
  }%
}

\SahandTryMainFont
\SahandTryMathFont
\SahandTryPersianFont

\newcommand{\textfa}[1]{{\persianfont #1}}

