%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LaTeX template for PhD CD cover
%
% (C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*******************************************************************}
\message{LaTeX template for PhD CD cover}
\message{(C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)}
\message{*******************************************************************}

\NeedsTeXFormat{LaTeX2e}%[1996/12/01]
\ProvidesClass{phdcd}[2018/05/11 PhD CD cover class]

\DeclareOption{showcircles}{\newcommand{\showcircles}{true}}
\ProcessOptions\relax

\LoadClass{minimal}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[main=english,czech]{babel}
\RequirePackage[%
	paperheight=120mm,%
	paperwidth=120mm,%
	top=1mm,%
	left=1mm,%
	bottom=1mm,%
	right=1mm,%
]{geometry}
\RequirePackage{graphicx}
\RequirePackage{pict2e}

% lengths
\setlength{\unitlength}{1mm}
\setlength{\parindent}{0pt}

% fonts
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled]{helvet}

% circles
\newcommand{\circles}{%
	\@ifundefined{showcircles}{}{%
	\vfill%
	\par%
	\begin{picture}(0,0)(0,0)%
		\put(0,59){\circle{118}}%
		\put(0,59){\circle{36}}%
		\put(0,59){\circle{15}}%
	\end{picture}%
	}%
	\par%
}

% output
\newcommand{\coverline}[1]{\textbf{\MakeUppercase{#1}}\par}
\newcommand{\doEverything}{%
	\fontsize{14.5pt}{19pt}\selectfont%
	\setlength{\parindent}{0cm}%
	\centering%
	\vspace*{5mm}%
	{\includegraphics[width=30mm]{../figs/ctu/symbol-bw}\par}%
	\vspace{45mm}%
	\coverline{\university}%
	\coverline{\faculty}%
	\coverline{\thesisType}%
	\coverline{\authorName}%
	\coverline{\submissionYear}%
	\circles%
}

\AtBeginDocument{%
	\doEverything%
}

% input
\input{../common/thesisdata}

% hyperref for pdf output
\RequirePackage{hyperref}
\def\cdcover{CD cover}
\hypersetup{
	pdftitle={\authorName, \thesisType, \cdcover},%
	pdfauthor={\authorName},%
	pdfcreator={\authorName},%
	pdfproducer={\authorName},%
	pdfsubject={\cdcover},%
	pdfkeywords={\thesisType, \cdcover}%
	pdflang={en},%
	unicode={true}%
}
