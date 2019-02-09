%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LaTeX template for PhD thesis
%
% (C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*******************************************************************}
\message{LaTeX template for PhD thesis}
\message{(C) 2018  Jan Strnsk  (jan.stransky@fsv.cvut.cz)}
\message{*******************************************************************}

\NeedsTeXFormat{LaTeX2e}%[1996/12/01]
\ProvidesClass{phdthesis}[2018/05/11 PhD thesis class]

\newcommand{\showframe}{false}
\DeclareOption{showframe}{\renewcommand{\showframe}{true}}
\ProcessOptions\relax

\LoadClass[12pt,twoside,openright]{report}
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

\let\partOrig\part
\let\myparttitle\empty
\let\mytitleintro\empty
\renewcommand{\part}[1]{
	\cleardoublepageempty
	\pagestyle{empty}
	\doubleblankpage%
	\partOrig{#1}%
	\pagestyle{main}%
	\renewcommand{\myparttitle}{#1}% \parttitle does not work with titleps
	\renewcommand{\mytitleintro}{\empty}
}

\let\chapterOrig\chapter
\newcommand{\mychapter}[2][]{%
	\chapterOrig[#1]{#2}%
	\renewcommand{\mytitleintro}{1}%
}
\newcommand{\mychapterStar}[1]{%
	\chapterOrig*{#1}%
}
\renewcommand{\chapter}{%
	\@ifstar{\mychapterStar}{\@dblarg\mychapter}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% titleps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titleps}
\newpagestyle{main}{%
	\setheadrule{.7pt}%
	\sethead*{%
		\sc%
		\ifthenelse{\equal{\mypagestyle}{nonumber}}%
			{}%
			{\ifthenelse{\equal{\mytitleintro}{\empty}}%
				{\myparttitle}%
				{\thechapter\ \ \chaptertitle}%
			}
		}%
		{}%
		{\thepage}%
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
\RequirePackage{xcolor}
\definecolor{colorCTU}{RGB}{0,101,189}

\RequirePackage{enumitem}
\setitemize{itemsep=0em,topsep=.5em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\mydotfill}[1]{\leavevmode \cleaders \hb@xt@ #1{\hss .\hss }\hfill \kern \z@}

\newcommand{\cleardoublepageempty}{%
	\newpage%
	\pagestyle{empty}%
	\cleardoublepage%
	\pagestyle{main}%
}
\newcommand{\blankpage}{\newpage\null\thispagestyle{empty}\newpage}
\newcommand{\doubleblankpage}{\blankpage\blankpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cover, title page, declaration, abstract ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\coverline}[1]{%
	\saveexpandmode%
	\expandarg%
	\StrSubstitute{#1}{ }{\noexpand\protect\\}[\tmptmp]%
	\restoreexpandmode%
	\MakeUppercase{\tmptmp}%
	\par%
}

\RequirePackage{xstring}
\newcommand{\thesisCoverAndTitlepageAndDeclarationAndAbstract}{%
	\headingNonumber%
	\pagenumbering{roman}%
	\pagestyle{empty}%
	\hypersetup{pageanchor=false}% to get rid of "pdfTeX warning (ext4): destination with the same identifier (name{page.i}) has been already used, duplicate ignored
	% cover
	\newgeometry{inner=75.5mm,outer=0.0mm,top=22mm,bottom=22mm}%
	\begin{titlepage}%
		\raggedright%
		\fontsize{24pt}{28.5pt}\selectfont%
		\setlength{\parindent}{0cm}%
		\hyphenpenalty=10000%
		%
		\bf%
		\coverline{\university}%
		\vspace{\baselineskip}%
		\coverline{\faculty}%
		\vspace{2.35\baselineskip}%
		\includegraphics[width=58mm]{../figs/ctu/symbol}\par%
		\vspace{2.5\baselineskip}%
		\coverline{\thesisType}%
		\vspace{1\baselineskip}%
		\coverline{\submissionYear}%
		\vfill%
		\coverline{\authorName}%
	\end{titlepage}%
	% title page
	\cleardoublepage%
	\newgeometry{inner=1.0in,outer=1.0in,top=0.6in,bottom=0.65in}%
	\begin{titlepage}%
		\centering%
		\includegraphics[height=18mm]{../figs/ctu/symbol}\par%
		\vspace{3mm}%
		\textbf{\MakeUppercase{\university}}\par%
		\vspace{-3mm}%
		{\color{colorCTU}{\rule{\textwidth}{.35mm}}}\par%
		\vspace{-.5mm}%
		{\footnotesize\textbf{\faculty}\par}%
		\vspace{1mm}%
		{\footnotesize\textbf{\department}\par}%
		\vspace{16mm}%
		\parbox[c][50mm]{\textwidth}{\centering\large\textbf{\thesisTitle}\par}\par%
		\vspace{44mm}%
		{\large\textbf{\MakeUppercase{\thesisType}}\par}%
		\vspace{10mm}%
		{{\textbf{\authorDegree\ \authorName}}\par}%
		\vfill%
		\begin{flushleft}%
			\noindent Doctoral study programme: \PhDProgramme\par%
			\vspace{2mm}%
			\noindent Branch of study: \branchOfStudy\par%
			\vspace{9.5mm}%
			\noindent Doctoral thesis supervisor: \supervisor\par%
		\end{flushleft}%
		\vspace{24mm}%
		\textbf{\submissionPlace, \submissionYear}\par%
		\vspace{4mm}
	\end{titlepage}%
	%
	\restoregeometry%
	% declaration
	\cleardoublepage%
	\noindent%
	\begin{minipage}[t]{.17\textwidth}%
		% http://tex.stackexchange.com/questions/309310/how-can-i-align-a-minipage-of-text-to-a-minipage-of-figure
		\raisebox{\dimexpr-\height+\ht\strutbox}{\includegraphics[height=18mm]{../figs/ctu/symbol-bw}}%
	\end{minipage}%
	\begin{minipage}[t]{.81\textwidth}%
		\vspace{-2.3mm}%
		\textbf{\MakeUppercase{\university}}\par%
		\vspace{-3.2mm}%
		\rule{\textwidth}{1pt}\par%
		\vspace{-1mm}%
		{\footnotesize\textbf{\noindent\faculty}}\par%
		\vspace{-.5mm}%
		{\footnotesize\noindent \address\par}%
	\end{minipage}\par%
	{\sf%
		\vspace{15mm}%
		\begin{center}%
			{\Large\textbf{DECLARATION}\par}%
		\end{center}\par%
		\vspace{11mm}%
		\noindent Ph.D. student's name: \authorName\par%
		\vspace{4mm}%
		\begin{raggedright}%
		\noindent Title of doctoral thesis: \nohyphens{\thesisTitle}\par%
		\end{raggedright}%
		\vspace{9mm}%
		\noindent I hereby declare that this doctoral thesis is my own work and effort written under the \mbox{guidance} of my supervisor, \supervisor\par% the end sentence period contained in \supervisor macro%
		\noindent All sources and other materials used have been quoted in the list of references.\par%
		\vspace{5mm}%
		\noindent The doctoral thesis was written in connection with research projects:\thesisProjects\par%
		\vspace{19mm}%
		\noindent%
		\begin{minipage}[t]{.45\textwidth}%
			In \submissionPlace, \submissionDate%
		\end{minipage}%
		\hfill%
		\begin{minipage}[t]{.5\textwidth}%
			\centering%
			\mydotfill{.3em}\par%
			signature%
		\end{minipage}%
		\par%
	}%
	%
	\cleardoublepage%
	\hypersetup{pageanchor=true}%
	\setcounter{page}{1}%
	\pagestyle{main}%
	% abstract
	\chapter*{Abstrakt}%
	\chaptermark{Abstrakt}%
	\abstractCS%
	\par%
	\vspace{2em}%
	\noindent \emph{Klíčová~slova:} \keywordsCS%
	%
	\cleardoublepageempty%
	\chapterNonumber{Abstract}%
	\abstract%
	\par%
	\vspace{2em}%
	\begin{sloppypar}%
	\noindent \emph{Keywords:} \keywords%
	\end{sloppypar}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% list of whatever, references, ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

\newcommand{\thesisReferences}{%
	\headingNonumber%
	\cleardoublepageempty%
	\phantomsection%
	\renewcommand{\bibname}{References}%
	\addcontentsline{toc}{chapter}{\bibname}%
	\chaptermark{\bibname}%
	\chapter*{\bibname}%
	{\small\printbibliography[heading=none]}%
}

\newcommand{\thesisTableOfContents}{%
	\cleardoublepageempty%
	\pdfbookmark{\contentsname}{toc}%
	\chaptermark{\contentsname}%
	\tableofcontents%
}
% to prevent Overfull \hbox warnings for TOC section
\renewcommand{\@pnumwidth}{1.9em} 
\renewcommand{\@tocrmarg}{2em}

\newcommand{\thesisListOfFigures}{%
	\cleardoublepageempty%
	\phantomsection%
	\addcontentsline{toc}{chapter}{\listfigurename}%
	\chaptermark{\listfigurename}%
	\listoffigures%
}

\newcommand{\thesisListOfTables}{%
	\cleardoublepageempty%
	\phantomsection%
	\addcontentsline{toc}{chapter}{\listtablename}%
	\chaptermark{\listtablename}%
	\listoftables%
}

\newcommand{\thesisAppendix}{%
	\cleardoublepageempty%
	\headingNormal%
	\appendix%
}

\newcommand{\thesisStartOfBody}{%
	\blankpage%
	\cleardoublepage%
	\pagenumbering{arabic}%
	\headingNormal%
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
	pdfsubject={Doctoral thesis},%
	pdfkeywords={\keywords},%
	pdfpagemode={UseOutlines},%
	pdfpagelayout={TwoPageRight},%
	pdflang={en},%
	unicode={true}%
}
