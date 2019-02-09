%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LaTeX template for PhD thesis statement
%
% (C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*******************************************************************}
\message{LaTeX template for PhD thesis statement}
\message{(C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)}
\message{*******************************************************************}

\NeedsTeXFormat{LaTeX2e}%[1996/12/01]
\ProvidesClass{phdthesisstatement}[2018/05/11 PhD thesis statement class]

\newcommand{\showframe}{false}
\DeclareOption{showframe}{\renewcommand{\showframe}{true}}
\ProcessOptions\relax

\LoadClass[12pt,twoside]{report}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% base packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[%
	inner=1in,%
	outer=1in,%
	top=1in,%
	bottom=1in,%
	a4paper,%
	showframe=\showframe%
]{geometry}
\RequirePackage{cmap}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[main=english,czech]{babel}
\RequirePackage{csquotes}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BiBTeX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyphenat}
\RequirePackage[style=numeric,giveninits=true,backend=biber,maxnames=99]{biblatex}
\DeclareFieldFormat[article]{title}{#1}
\renewbibmacro{in:}{\ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}
%
\addbibresource{../common/references.bib}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% titlesec
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\part}[display]{\centering\normalfont\Huge\sf\bfseries}{Part \thepart.}{1em}{\thispagestyle{empty}}
\titleformat{name=\chapter}{\normalfont\LARGE\bfseries\filinner}{}{0em}{\thispagestyle{main}\thechapter\hspace{.6em}}
\titleformat{name=\chapter,numberless}{\normalfont\LARGE\bfseries\filinner}{}{0em}{\thispagestyle{main}}
\titleformat{\section}{\normalfont\Large\bfseries}{}{0em}{\thesection\hspace{.6em}}
\titleformat{\subsection}{\normalfont\large\bfseries}{}{0em}{\thesubsection\hspace{.6em}}
\setcounter{secnumdepth}{3}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{}{0em}{\thesubsubsection\hspace{.6em}}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries}{}{0em}{}
\titlespacing*{\chapter}{0pt}{*0}{*3}
\newcommand{\chapterNonumber}[1]{%
	\phantomsection%
	\addcontentsline{toc}{chapter}{#1}%
	\chapter*{#1}%
	\chaptermark{#1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% titleps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titleps}
\newpagestyle{main}{%
	\setheadrule{.7pt}%
	\sethead*{%
		\sc%
		\ifthenelse{\equal{\mypagestyle}{nonumber}}{}{\thechapter\ \ }%
		\chaptertitle}{}{\thepage}%
}
\newcommand{\headingstyle}{normal}
\newcommand{\setheadingstyle}[1]{%
	\renewcommand{\headingstyle}[2]{##1}%
}

\newcommand{\mypagestyle}{normal}
\newcommand{\headingNormal}{\edef\mypagestyle{normal}}
\newcommand{\headingNonumber}{\edef\mypagestyle{nonumber}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled]{helvet}
\RequirePackage[helvet]{sfmath}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[%
	labelsep=colon,%
	justification=centering,%
	margin=1cm,%
	figureposition=below,%
	tableposition=above%
]{caption}
\RequirePackage{graphicx}

\RequirePackage{enumitem}
\setitemize{itemsep=0em,topsep=.5em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\thesisStatementReferences}{%
	\renewcommand{\bibname}{References}%
	\chaptermark{\bibname}%
	\chapter{\bibname}%
	{\footnotesize\printbibliography[heading=none]}%
}

\newcommand{\chapterAbstract}{%
	\chapter{Abstract}%
	\abstract%
	\vspace{2em}%
	\noindent \emph{Keywords:} \keywords%
}

% https://tex.stackexchange.com/questions/372871/remove-spaces-from-macro-argument
\RequirePackage{xinttools}
\catcode`_ 11
\newcommand\EmptinessFilter[1]{\if\relax\detokenize{#1}\relax\expandafter\xint_gobble_thenstop\fi{#1}}
\catcode`_ 8
\newcommand{\thesisRefSection}[2]{%
	\paragraph{#1}%
	\begin{refsection}%
		\expandafter\nocite\expandafter{\romannumeral0\xintlistwithsep{,}{\xintApplyUnbraced\EmptinessFilter{\xintCSVtoListNoExpand{#2}}}}%
		\newrefcontext[sorting=ynt]%
		\printbibliography[heading=none]%
	\end{refsection}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cover, title page, declaration, abstract ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\firstpages}{%
	\pagestyle{empty}%
	\hypersetup{pageanchor=false} % to get rid of "pdfTeX warning (ext4): destination with the same identifier (name{page.i}) has been already used, duplicate ignored
	% cover and title page
	\newgeometry{inner=1.0in,outer=1.0in,top=40mm,bottom=20mm}%
	\begin{titlepage}%
		\centering%
		\textbf{\large\MakeUppercase{\university}}\par%
		\vspace{30mm}%
		{\includegraphics[width=77mm]{../figs/ctu/symbol-bw}\par}%
		\vspace{34mm}%
		\textbf{\large\MakeUppercase{doctoral thesis statement}}\par%
	\end{titlepage}%
	%
	\cleardoublepage
	\newgeometry{inner=0.9in,outer=0.9in,top=25.5mm,bottom=20mm}%
	\begin{titlepage}%
		\centering%
		\textbf{\large\MakeUppercase{\university}}\par%
		\textbf{\normalsize\faculty}\par%
		\textbf{\normalsize\department}\par%
		\vspace{39mm}%
		{\Large\authorDegree\ \authorName\par}%
		\vspace{8mm}%
		\parbox[c][40mm]{\textwidth}{\centering\large\MakeUppercase{\thesisTitle}\par}\par%
		\vspace{16mm}%
		Ph.D Programme: \textbf{\PhDProgramme}\par%
		Branch of study: \textbf{\branchOfStudy}\par%
		\vspace{25mm}%
		{\large\textbf{Doctoral thesis statement for obtaining the degree of „Doctor“, abbreviated to „Ph.D.”}\par}%
		\vspace{46mm}%
		{\Large\submissionPlace, \monthname[\submissionMonth], \submissionYear\par}%
	\end{titlepage}%
	%
	\restoregeometry%
	%
	\clearpage%
	\hypersetup{pageanchor=true}%
	\setcounter{page}{1}%
	\pagestyle{main}%
	% table of contents
	\pdfbookmark{\contentsname}{toc}%
	\chaptermark{\contentsname}%
	\tableofcontents%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\input{../common/thesisdata}
\input{../common/commands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% misc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pdfsuppresswarningpagegroup=1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hyperref for pdf output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[unicode]{hyperref}
\hypersetup{%
	pdftitle={\thesisTitle},%
	pdfauthor={\authorName},%
	pdfcreator={\authorName},%
	pdfproducer={\authorName},%
	pdfsubject={Doctoral thesis statement},%
	pdfkeywords={\keywords},%
	pdfpagemode={UseOutlines},%
	pdflang={en},%
	unicode={true}%
}

\AtBeginDocument{%
	\headingNonumber%
	\firstpages%
}
\AtEndDocument{%
	\pagestyle{empty}%
	\cleardoublepage%
	\newpage\null%
}
