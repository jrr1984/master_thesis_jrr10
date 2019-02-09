%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LaTeX template for PhD thesis presentation
%
% (C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*******************************************************************}
\message{LaTeX template for PhD thesis presentation}
\message{(C) 2018  Jan Stránský  (jan.stransky@fsv.cvut.cz)}
\message{*******************************************************************}

\NeedsTeXFormat{LaTeX2e}%[1996/12/01]
\ProvidesClass{phdpresentation}[2018/05/11 PhD thesis presentation class]

\LoadClassWithOptions{beamer}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% base packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[main=english,czech]{babel}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% beamer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\mode<presentation>
\mode<all>
\setbeamercovered{transparent}

% footline
\setbeamertemplate{footline}{\hfill\insertframenumber{} / \inserttotalframenumber{}\hspace{3mm}\strut}
\setbeamercolor{footline}{fg=gray}
\beamertemplatenavigationsymbolsempty

% set size
\setbeamersize{text margin left=2.9em,text margin right=2em}

% bullets, itemize
\useinnertheme{rectangles}
\newenvironment{myitemize}{%
	\vspace{-.3em}%
	\begin{itemize}%
	\setlength{\itemsep}{0pt}%
}{%
	\end{itemize}%
	\vspace{-.3em}%
}

% to make \setbeamertemplate work ...
\def\insertframetitle{}
\def\insertframesubtitle{}

% headline and frametitle
\setbeamertemplate{frametitle}{}
\setbeamertemplate{headline}{%
	\hbox{%
		\begin{beamercolorbox}[wd=0.95\paperwidth,ht=1.5cm, right]{headline}%
			\small%
			\MakeUppercase{\insertframetitle}\strut\par%
			\vspace{1mm}%
			\MakeUppercase{\insertframesubtitle}\strut\par%
			\vfill%
		\end{beamercolorbox}%
	}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\definecolor{ctuBlue}{RGB}{0,101,189}
\definecolor{ctuRed}{RGB}{198,12,48}
\definecolor{ctuGreen}{RGB}{162,173,0}
\definecolor{ctuLightBlue}{RGB}{106,173,228}
\definecolor{blockGray}{RGB}{240,240,240}
\setbeamercolor{structure}{fg=ctuBlue}
\setbeamercolor{block title}{bg=ctuBlue,fg=white}
\setbeamercolor{block body}{bg=blockGray}
\setbeamercolor{block title alerted}{bg=ctuRed,fg=white}
\setbeamercolor{block body alerted}{bg=blockGray,fg=ctuRed}
\setbeamercolor{alerted text}{fg=ctuRed}
\setbeamercolor{block title example}{bg=ctuGreen,fg=white}
\setbeamercolor{block body example}{bg=blockGray}
\setbeamercolor{example text}{fg=ctuGreen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled]{helvet}
\RequirePackage[helvet]{sfmath}
\setbeamerfont{title page}{series=\bfseries}
\setbeamerfont{headline}{series=\bfseries}
\setbeamerfont{block title}{series=\bfseries}
\setbeamerfont{block body}{series=\bfseries}
\setbeamerfont{structure}{series=\bfseries}
\setbeamerfont{footline}{size=\footnotesize}
\AtBeginDocument{\bfseries\selectfont} % normal text 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% background
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbeamertemplate{background canvas}{%
	\includegraphics[width=\paperwidth,height=\paperheight]{figs/background/1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbeamertemplate{title page}{%
	\begin{columns}%
		\begin{column}{1.3em}%
		\end{column}%
		\begin{column}{\dimexpr\textwidth-1.3em}%
			\color{white}%
			\vspace*{2em}
			\parbox[c][6em]{\textwidth}{\LARGE\inserttitle\par}%
			\par%
			\vspace{10mm}%
			\insertauthor\par%
			\insertinstitute\par%
			\insertdate%
		\end{column}%
	\end{columns}%
}

\newcommand{\titleframe}{%
	{%
		\usebackgroundtemplate{%
			\includegraphics[width=\paperwidth,height=\paperheight]{figs/background/0}%
		}%
		\begin{frame}%
			\clearpage%
			\thispagestyle{empty}%
			\vspace*{5mm}%
			\titlepage%
		\end{frame}%
	}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% environments and commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% discussion
\newenvironment{discussion}{%
	\part{Discussion}%
   \newcounter{framenumberappendix}%
   \setcounter{framenumberappendix}{\value{framenumber}}%
	\setbeamertemplate{footline}{}%
	\begin{frame}%
	\end{frame}%
	\AtBeginSection{}%
}{%
   \addtocounter{framenumberappendix}{-\value{framenumber}}%
   \addtocounter{framenumber}{\value{framenumberappendix}} %
}

% questionblock
\newenvironment{questionblock}{%
	\begin{block}{Question}%
	\footnotesize%
}{%
	\end{block}%
}

% answerblock
\newenvironment{answerblock}{%
	\begin{block}{Answer}%
}{%
	\end{block}%
}

% questionframe
\newenvironment{questionframe}[1]{%
	\subsection{Question #1}%
	\begin{frame}%
		\frametitle{Discussion}%
		\framesubtitle{\secname, \subsecname}%
}{%
	\end{frame}%
}

% outlineframe
\newcommand{\outlineframe}[1][]{%
	{%
		\setbeamertemplate{footline}{}%
		\begin{frame}%
			\frametitle{Outline}%
			\tableofcontents[hideallsubsections,#1]%
		\end{frame}%
	}%
	\setcounter{framenumber}{0}%
}

% twocolumn layout
\newcounter{twocolumncounter}
\newenvironment{twocolumns}{%
	\setcounter{twocolumncounter}{0}%
	\begin{columns}[onlytextwidth,totalwidth=1.033\textwidth]%
}{%
	\end{columns}%
}
\let\onecolumn\undefined
\newenvironment{onecolumn}{%
	\ifthenelse{\value{twocolumncounter}=0}{}{\hfill}%
	\addtocounter{twocolumncounter}{1}%
	\begin{column}{.475\textwidth}%
}{%
	\end{column}%
}

% theorems, proofs ...
\let\@addpunct\@gobble
\renewcommand{\qedsymbol}{{\color{ctuBlue}{$\blacksquare$}}}
\setbeamertemplate{theorems}[normal font]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\input{../common/thesisdata}
\input{../common/commands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginSection{%
	{%
		\setbeamertemplate{footline}{}%
		\begin{frame}%
			\tableofcontents[currentsection,hideallsubsections]%
		\end{frame}%
		\addtocounter{framenumber}{-1}%
	}%
}

\AtBeginDocument{%
	\part{Presentation}%
	\titleframe%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hyperref for pdf output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage[unicode]{hyperref} % already loaded...
\hypersetup{%
	pdftitle={\thesisTitle},%
	pdfauthor={\authorName},%
	pdfcreator={\authorName},%
	pdfproducer={\authorName},%
	pdfsubject={Doctoral thesis presentation},%
	pdfkeywords={\keywords},%
	pdflang={en},%
	unicode={true}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% misc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{\thesisTitle}
\author{\authorName}
\institute{\department\par\faculty\par\university}
\date{\defenseDate}
