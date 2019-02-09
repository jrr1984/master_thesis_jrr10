%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LaTeX template for PhD thesis poster
%
% (C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*******************************************************************}
\message{LaTeX template for PhD thesis poster}
\message{(C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)}
\message{*******************************************************************}

\NeedsTeXFormat{LaTeX2e}%[1996/12/01]
\ProvidesClass{phdposter}[2018/05/11 PhD thesis poster class]

\newcommand{\showframe}{false}
\DeclareOption{showframe}{\renewcommand{\showframe}{true}}
\ProcessOptions\relax

\LoadClass{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% base packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{cmap}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[main=english,czech]{babel}
\RequirePackage[%
	b1paper,%
	inner=3cm,%
	outer=3cm,%
	top=3cm,%
	bottom=3cm,%
	showframe=\showframe%
]{geometry}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{anyfontsize}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled]{helvet}
\RequirePackage[helvet]{sfmath}
\renewcommand{\tiny}{\fontsize{14.40}{18} \selectfont}
\renewcommand{\scriptsize}{\fontsize{17.28}{22}\selectfont}
\renewcommand{\footnotesize}{\fontsize{20.74}{25}\selectfont}
\renewcommand{\small}{\fontsize{24.88}{30}\selectfont}
\renewcommand{\normalsize}{\fontsize{29.86}{37}\selectfont}
\renewcommand{\large}{\fontsize{35.83}{45}\selectfont}
\renewcommand{\Large}{\fontsize{43.00}{54}\selectfont}
\renewcommand{\LARGE}{\fontsize{51.60}{64}\selectfont}
\renewcommand{\huge}{\fontsize{61.92}{77}\selectfont}
\renewcommand{\Huge}{\fontsize{74.30}{93}\selectfont}
\newcommand{\veryHuge}{\fontsize{89.16}{112}\selectfont}
\newcommand{\VeryHuge}{\fontsize{107.0}{134}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\definecolor{ctu}{RGB}{0,101,189}
\colorlet{bg}{ctu!20}
\newenvironment{mycolorbox}{%
	\begin{lrbox}{0}%
}{%
	\end{lrbox}%
	\colorbox{bg}{\usebox{0}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% frames, rows, columns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% some dimensions
\newcommand{\posterframetitleheight}{2.2em}
\newcommand{\posterframemarginH}{.35em}
\newcommand{\posterframemarginV}{.5em}
\newlength{\posterframeskip}
\setlength{\posterframeskip}{10mm}
\setlength{\fboxsep}{0pt}
\setlength{\parindent}{0pt}

% posterframe
\newenvironment{posterframe}[3]{
	\begin{minipage}[t][#2]{#1}%
		\colorbox{ctu}{%
			\parbox[c][\posterframetitleheight]{\textwidth}{\hspace*{.9em}\textbf{\large \color{white}{#3}}}%
		}%
		\par%
		\vspace{-.4mm}%
		\begin{mycolorbox}
			\hspace*{\posterframemarginH}%
			\begin{minipage}[t][\dimexpr #2-\posterframetitleheight]{\dimexpr \textwidth-\posterframemarginH-\posterframemarginH}%
				\rule{0em}{1em}%
				\par%
				\vspace{\dimexpr -1em-.45\baselineskip+\posterframemarginV}%
}{%
			\end{minipage}%
			\hspace*{\posterframemarginH}%
		\end{mycolorbox}%
	\end{minipage}%
}

% posterframecontent
\newcommand{\posterframecontent}[3]{%
	\expandafter\newcommand\csname posterframetitle#1\endcsname{#2}
	\expandafter\newcommand\csname posterframecontent#1\endcsname{#3}
}

% makeposterframe
\newcommand{\makeposterframe}[1]{%
	\begin{posterframe}{\textwidth}{\rowheight}{\csname posterframetitle#1\endcsname}
		\csname posterframecontent#1\endcsname
	\end{posterframe}
}

% row
\newlength\rowheight
\newenvironment{row}[1]{%
	\setlength{\rowheight}{#1}%
	\begin{minipage}[t][#1]{\textwidth}%
}{%
	\end{minipage}%
	\hspace{-\posterframeskip}%
	\par\vspace{\posterframeskip}%
}

% column
\newlength\colheight
\newenvironment{column}[1]{%
	\setlength{\colheight}{\rowheight}%
	\begin{minipage}[t][\rowheight]{#1}%
}{%
	\end{minipage}%
	\hspace{\posterframeskip}%
	\ignorespacesafterend%
}

% relative row and column dimensions
\newcommand{\sidecolumnwidth}[1]{\dimexpr #1\textwidth-.5\posterframeskip}
\newcommand{\middlecolumnwidth}[1]{\dimexpr #1\textwidth-\posterframeskip}
\newcommand{\siderowheight}[1]{\dimexpr #1\colheight-.5\posterframeskip}
\newcommand{\middlerowheight}[1]{\dimexpr #1\colheight-\posterframeskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% title
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\postertitle}{%
	\begin{center}
		\LARGE\textbf\thesisTitle\par
	\end{center}%
	\vspace{.9em}%
	\begin{minipage}{.2\textwidth}%
		\centering%
		\includegraphics[height=5cm]{../figs/ctu/symbol}%
	\end{minipage}%
	\hfill%
	\begin{minipage}{.79\textwidth}%
		\Large%
		\textbf{\authorDegree\ \authorName}, Supervisor: \textbf{\supervisor}\par%
		\large%
		\department,%
		\faculty,%
		\university%
		\par%
		Period of doctoral study: \periodOfDoctoralStudy\par%
	\end{minipage}%
	\par%
	\vspace{\posterframeskip}%
	\noindent\makebox[\linewidth]{\color{ctu}\rule{\paperwidth}{2mm}}%
	\par%
	\vspace{\posterframeskip}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other packages and commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}
\setlist[itemize,enumerate]{nolistsep}

\newenvironment{selectedPublications}{%
	\begin{enumerate}[label={[\arabic*]},leftmargin=1.5em,labelsep=.4em]%
}{%
	\end{enumerate}%
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
	pdfsubject={Doctoral thesis poster},%
	pdfkeywords={\keywords},%
	pdflang={en},%
	unicode={true}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{\thesisTitle}
\pagestyle{empty}
\AtBeginDocument{%
	\normalsize%
	\postertitle%
}
