\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}
\def\@classname{techreport}
\RequirePackage{xkeyval}
\RequirePackage{xstring}
\define@boolkey+{techreport.cls}[@TR@]{screen}[true]{%
	\if@TR@screen
		\PackageInfo{\@classname}{Using screen mode}%
	\else
		\PackageInfo{\@classname}{Not using screen mode}%
	\fi%
}{\PackageError{\@classname}{The option screen can be either true or false}}
\ExecuteOptionsX{screen=false}
\define@boolkey+{techreport.cls}[@TR@]{libertine}[true]{%
	\if@TR@libertine
		\PackageInfo{\@classname}{Using libertine fonts}%
	\else
		\PackageInfo{\@classname}{Not using libertine fonts}%
	\fi%
}{\PackageError{\@classname}{The option libertine can be either true or false}}
\ExecuteOptionsX{libertine=false}
\define@boolkey+{techreport.cls}[@TR@]{charter}[true]{%
	\if@TR@charter
		\PackageInfo{\@classname}{Using charter fonts}%
	\else
		\PackageInfo{\@classname}{Not using charter fonts}%
	\fi%
}{\PackageError{\@classname}{The option charter can be either true or false}}
\ExecuteOptionsX{charter=false}
\define@boolkey+{techreport.cls}[@TR@]{single}[true]{%
	\if@TR@single
		\PackageInfo{\@classname}{Using single-sided layout}%
	\else
		\PackageInfo{\@classname}{Not using single-sided layout}%
	\fi%
}{\PackageError{\@classname}{The option single can be either true or false}}
\ExecuteOptionsX{single=false}
\define@boolkey+{techreport.cls}[@TR@]{showonlyrefs}[true]{%
	\if@TR@showonlyrefs
		\PackageInfo{\@classname}{Using showonlyrefs mode for mathtools}%
	\else
		\PackageInfo{\@classname}{Not using showonlyrefs mode for mathtools}%
	\fi%
}{\PackageError{\@classname}{The option showonlyrefs can be either true or false}}
\ExecuteOptionsX{showonlyrefs=false}
\def\TR@fontsize{}
\DeclareOptionX{9pt}{\edef\TR@fontsize{\CurrentOption}}
\DeclareOptionX{10pt}{\edef\TR@fontsize{\CurrentOption}}
\DeclareOptionX{11pt}{\edef\TR@fontsize{\CurrentOption}}
\DeclareOptionX{12pt}{\edef\TR@fontsize{\CurrentOption}}
\ProcessOptionsX
\def\TR@column{}
\def\@TR@twocolumn{twocolumn}
\DeclareOptionX{onecolumn}{\edef\TR@column{\CurrentOption}}
\DeclareOptionX{twocolumn}{\edef\TR@column{\CurrentOption}}
\ProcessOptionsX
\LoadClass[\TR@fontsize,\TR@column]{extarticle}
\RequirePackage{amsmath,amsfonts,amsthm,amssymb}
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{refcount}
\RequirePackage{totpages}
\RequirePackage{environ}
\RequirePackage{textcase}
\ifx\TR@column\@TR@twocolumn
	\RequirePackage[style=TR-Reference-Numeric]{biblatex}
	\setlength\bibsep{\parskip}
\else
	\RequirePackage[style=TR-Reference-Alpha]{biblatex}
\fi
\RequirePackage[bookmarksnumbered,unicode]{hyperref}
\pdfstringdefDisableCommands{%
	\def\unskip{}%
	\def\textbullet{- }%
	\def\textrightarrow{ -> }%
	\def\footnotemark{}%
}
\urlstyle{rm}
\ifx\TR@column\@TR@twocolumn
	\urlstyle{sf}
\fi
\AtEndPreamble{%
	\if@TR@screen\hypersetup{colorlinks,linkcolor=Red,citecolor=Purple,urlcolor=DarkBlue,filecolor=DarkBlue}\else\hypersetup{hidelinks}\fi%
}
\RequirePackage{graphicx}
\RequirePackage[prologue]{xcolor}
\definecolor[named]{Blue}{cmyk}{1,0.1,0,0.1}
\definecolor[named]{Yellow}{cmyk}{0,0.16,1,0}
\definecolor[named]{Orange}{cmyk}{0,0.42,1,0.01}
\definecolor[named]{Red}{cmyk}{0,0.90,0.86,0}
\definecolor[named]{LightBlue}{cmyk}{0.49,0.01,0,0}
\definecolor[named]{Green}{cmyk}{0.20,0,1,0.19}
\definecolor[named]{Purple}{cmyk}{0.55,1,0,0.15}
\definecolor[named]{DarkBlue}{cmyk}{1,0.58,0,0.21}
\RequirePackage{geometry}
\if@TR@single
	\ifx\TR@column\@TR@twocolumn
		\geometry{twoside=false,head=13pt,paperwidth=8.5in,paperheight=11in,includeheadfoot=false,columnsep=2pc,top=1in,bottom=1in,left=0.75in,right=0.75in,marginparwidth=2pc,heightrounded}
	\else
		\geometry{twoside=false,includeheadfoot,head=13pt,foot=2pc,paperwidth=6.75in,paperheight=10in,top=58pt,bottom=44pt,left=46pt,right=46pt,marginparwidth=2pc,heightrounded}
	\fi
	\@mparswitchfalse
	\reversemarginpar
\else
	\ifx\TR@column\@TR@twocolumn
		\geometry{twoside=true,head=13pt,paperwidth=8.5in,paperheight=11in,includeheadfoot=false,columnsep=2pc,top=1in,bottom=1in,inner=0.75in,outer=0.75in,marginparwidth=2pc,heightrounded}
	\else
		\geometry{twoside=true,includeheadfoot,head=13pt,foot=2pc,paperwidth=6.75in,paperheight=10in,top=58pt,bottom=44pt,inner=46pt,outer=46pt,marginparwidth=2pc,heightrounded}
	\fi
\fi
\setlength\parindent{10\p@}
\setlength\parskip{\z@}
\RequirePackage{iftex}
\ifPDFTeX
\input{glyphtounicode}
\pdfglyphtounicode{f_f}{FB00}
\pdfglyphtounicode{f_f_i}{FB03}
\pdfglyphtounicode{f_f_l}{FB04}
\pdfglyphtounicode{f_i}{FB01}
\pdfglyphtounicode{t_t}{00740074}
\pdfglyphtounicode{f_t}{00660074}
\pdfglyphtounicode{T_h}{00540068}
\pdfgentounicode=1
\fi
\RequirePackage{cmap}
\RequirePackage[T1]{fontenc}
\if@TR@libertine
\ifxetex
	\RequirePackage[tt=false]{libertine}
	\setmonofont{inconsolata}
\else
	\RequirePackage[tt=false,type1=true]{libertine}
\fi
\RequirePackage[varqu]{zi4}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{mathrsfs}
\AtBeginDocument{%
	\DeclareMathAlphabet{\pazocal}{OMS}{zplm}{m}{n}%
	\renewcommand{\mathcal}{\pazocal}%
}
\else
\if@TR@charter
\RequirePackage[charter,cal=cmcal]{mathdesign}
\renewcommand{\sfdefault}{fvs}
\renewcommand{\ttdefault}{fvm}
\else
\if@TR@screen
\RequirePackage[nott,nosf]{kpfonts}
\RequirePackage[scaled=0.85]{berasans}
\RequirePackage[scaled=0.84]{beramono}
\else
\RequirePackage[light]{kpfonts}
\fi
\fi
\fi
\if@TR@libertine
\newcommand{\mathbbl}[1]{\vvmathbb{#1}}
\else
\RequirePackage{mathbbol}
\AtBeginDocument{%
	\DeclareSymbolFontAlphabet{\mathbb}{AMSb}%
	\DeclareSymbolFontAlphabet{\mathbbl}{bbold}%
}
\fi
\RequirePackage{caption,float}
\captionsetup[table]{position=top}
\ifx\TR@column\@TR@twocolumn
	\captionsetup{labelfont={bf},textfont={normalfont},labelsep=period,margin=\z@}
\else
	\captionsetup{labelfont={sf,small},textfont={sf,small},margin=\z@}
	\captionsetup[figure]{name={Fig.}}
\fi
\ifx\TR@column\@TR@twocolumn
	\def\labelenumi{\theenumi.}
	\def\labelenumii{\theenumii.}
	\def\labelenumiii{\theenumiii.}
	\def\labelenumiv{\theenumiv.}
\fi
\newdimen\@TR@labelwidth
\AtBeginDocument{%
	\setlength\labelsep{4pt}
	\setlength{\@TR@labelwidth}{6.5pt}

	%% First-level list: when beginning after the first line of an
	%% indented paragraph or ending before an indented paragraph, labels
	%% should not hang to the left of the preceding/following text.
	\setlength\leftmargini{\z@}
	\addtolength\leftmargini{\parindent}
	\addtolength\leftmargini{2\labelsep}
	\addtolength\leftmargini{\@TR@labelwidth}

	%% Second-level and higher lists.
	\setlength\leftmarginii{\z@}
	\addtolength\leftmarginii{0.5\labelsep}
	\addtolength\leftmarginii{\@TR@labelwidth}
	\setlength\leftmarginiii{\leftmarginii}
	\setlength\leftmarginiv{\leftmarginiii}
	\setlength\leftmarginv{\leftmarginiv}
	\setlength\leftmarginvi{\leftmarginv}
	\@listi}
\newskip\listisep
\listisep\smallskipamount
\def\@listI{\leftmargin\leftmargini
	\labelwidth\leftmargini \advance\labelwidth-\labelsep
	\listparindent\z@
	\topsep\listisep}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
	\labelwidth\leftmarginii \advance\labelwidth-\labelsep
	\topsep\z@skip}
\def\@listiii{\leftmargin\leftmarginiii
	\labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
	\labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
	\labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
	\labelwidth\leftmarginvi \advance\labelwidth-\labelsep}
\renewcommand{\descriptionlabel}[1]{\upshape\bfseries #1}
\renewenvironment{description}{\list{}{%
	\labelwidth\@TR@labelwidth
	\let\makelabel\descriptionlabel}%
}{
	\endlist
}
\let\enddescription=\endlist % for efficiency
\RequirePackage{comment}
\RequirePackage{textcomp}
\RequirePackage{fancyhdr}
\pagestyle{headings}
\def\@trplainbodyfont{\itshape}
\def\@trplainindent{\parindent}
\def\@trplainheadfont{\scshape}
\def\@trplainnotefont{\@empty}
\ifx\TR@column\@TR@twocolumn
	\def\@trplainbodyfont{\itshape}
	\def\@trplainindent{\z@}
	\def\@trplainheadfont{\bfseries}
	\def\@trplainnotefont{\normalfont}
\fi
\newtheoremstyle{trplain}%
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space above
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space below
	{\@trplainbodyfont}% body font
	{\@trplainindent}% indent amount
	{\@trplainheadfont}% head font
	{.}% punctuation after head
	{.5em}% spacing after head
	{\thmname{#1}\thmnumber{ #2}\thmnote{ {\@trplainnotefont(#3)}}}% head spec
\def\@trdefinitionbodyfont{\normalfont}
\def\@trdefinitionindent{\parindent}
\def\@trdefinitionheadfont{\bfseries}
\def\@trdefinitionnotefont{\@empty}
\ifx\TR@column\@TR@twocolumn
	\def\@trdefinitionbodyfont{\normalfont}
	\def\@trdefinitionindent{\z@}
	\def\@trdefinitionheadfont{\bfseries}
	\def\@trdefinitionnotefont{\normalfont}
\fi
\newtheoremstyle{trdefinition}%
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space above
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space below
	{\@trdefinitionbodyfont}% body font
	{\@trdefinitionindent}% indent amount
	{\@trdefinitionheadfont}% head font
	{.}% punctuation after head
	{.5em}% spacing after head
	{\thmname{#1}\thmnumber{ #2}\thmnote{ {\@trdefinitionnotefont(#3)}}}% head spec
\def\@trremarkbodyfont{\itshape}
\def\@trremarkindent{\parindent}
\def\@trremarkheadfont{\itshape}
\def\@trremarknotefont{\@empty}
\ifx\TR@column\@TR@twocolumn
	\def\@trremarkbodyfont{\itshape}
	\def\@trremarkindent{\z@}
	\def\@trremarkheadfont{\itshape}
	\def\@trremarknotefont{\normalfont}
\fi
\newtheoremstyle{trremark}%
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space above
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space below
	{\@trremarkbodyfont}% body font
	{\@trremarkindent}% indent amount
	{\@trremarkheadfont}% head font
	{.}% punctuation after head
	{.5em}% spacing after head
	{\thmname{#1}\thmnumber{ #2}\thmnote{ {\@trremarknotefont(#3)}}}% head spec
\theoremstyle{trplain}
\AtEndPreamble{%
	\theoremstyle{trplain}
	\newtheorem{theorem}{Theorem}[section]
	\newtheorem{conjecture}[theorem]{Conjecture}
	\newtheorem{proposition}[theorem]{Proposition}
	\newtheorem{lemma}[theorem]{Lemma}
	\newtheorem{corollary}[theorem]{Corollary}
	\theoremstyle{trdefinition}
	\newtheorem{definition}[theorem]{Definition}
	\newtheorem{observation}[theorem]{Observation}
	\newtheorem{challenge}[theorem]{Challenge}
	\newtheorem{principle}[theorem]{Principle}
	\theoremstyle{trremark}
	\newtheorem{example}[theorem]{Example}
	\newtheorem{remark}[theorem]{Remark}
	\newtheorem{fact}[theorem]{Fact}
	\theoremstyle{trplain}
}
\def\@proofnamefont{\scshape}
\def\@proofindent{\indent}
\ifx\TR@column\@TR@twocolumn
	\def\@proofnamefont{\itshape}
	\def\@proofindent{\noindent}
\fi
\renewenvironment{proof}[1][\proofname]{\par
	\pushQED{\qed}%
	\normalfont \topsep6\p@\@plus6\p@\relax
	\trivlist
	\item[\@proofindent\hskip\labelsep
	{\@proofnamefont #1\@addpunct{.}}]\ignorespaces
}{%
	\popQED\endtrivlist\@endpefalse
}
\AtEndPreamble{%
	\RequirePackage{flushend}%
}
\newcommand\acksname{Acknowledgments}
\specialcomment{acks}{%
	\begingroup
	\section*{\acksname}
	\phantomsection\addcontentsline{toc}{section}{\acksname}
}{%
	\endgroup
}
\RequirePackage{xspace}
\RequirePackage{enumerate}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{subcaption}
\RequirePackage{mathpartir}
\RequirePackage{turnstile}
\RequirePackage{mathtools}
\AtEndPreamble{%
	\if@TR@showonlyrefs\mathtoolsset{showmanualtags,showonlyrefs}\else\mathtoolsset{showmanualtags}\fi%
}
\RequirePackage{stmaryrd}
\RequirePackage{relsize}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{pseudo}
\RequirePackage{tikz}
\AtEndPreamble{%
	\usetikzlibrary{arrows,automata,chains,shapes,trees}%
}
\RequirePackage{xfrac}
\RequirePackage{marginnote}
\RequirePackage{authblk}
\RequirePackage{hhline}
\RequirePackage{rotating}
\RequirePackage{wrapfig}
\if@TR@showonlyrefs
	\AtEndPreamble{%
		\newcommand{\theoref}[1]{Thm.~\ref{The:#1}}%
		\newcommand{\theorefs}[2]{Thms.~\ref{The:#1} and~\ref{The:#2}}%
		\newcommand{\theorefsp}[3]{Thms.~\ref{The:#1}, \ref{The:#2} and~\ref{The:#3}}%
		\newcommand{\lemref}[1]{Lem.~\ref{Lem:#1}}%
		\newcommand{\lemrefs}[2]{Lemmas~\ref{Lem:#1} and~\ref{Lem:#2}}%
		\newcommand{\lemrefsp}[3]{Lemmas~\ref{Lem:#1},~\ref{Lem:#2} and~\ref{Lem:#3}}%
		\newcommand{\corref}[1]{Cor.~\ref{Cor:#1}}%
		\newcommand{\correfs}[2]{Cors.~\ref{Cor:#1} and~\ref{Cor:#2}}%
		\newcommand{\figref}[1]{Fig.~\ref{Fi:#1}}%
		\newcommand{\figrefs}[2]{Figs.~\ref{Fi:#1} and~\ref{Fi:#2}}%
		\newcommand{\figrefsp}[3]{Figs.~\ref{Fi:#1}, \ref{Fi:#2} and~\ref{Fi:#3}}%
		\newcommand{\defref}[1]{Defn.~\ref{De:#1}}%
		\newcommand{\defrefs}[2]{Defns.~\ref{De:#1} and~\ref{De:#2}}%
		\newcommand{\tableref}[1]{Tab.~\ref{Ta:#1}}%
		\newcommand{\tablerefs}[2]{Tabs.~\ref{Ta:#1} and~\ref{Ta:#2}}%
		\newcommand{\sectref}[1]{\S\ref{Se:#1}}%
		\newcommand{\sectrefs}[2]{\S\ref{Se:#1} and~\S\ref{Se:#2}}%
		\newcommand{\sectrefsp}[3]{\S\ref{Se:#1}, \S\ref{Se:#2} and~\S\ref{Se:#3}}%
		\newcommand{\sectseqref}[2]{\S\ref{Se:#1}--\S\ref{Se:#2}}%
		\newcommand{\exref}[1]{Ex.~\ref{Exa:#1}}%
		\newcommand{\exrefs}[2]{Exs.~\ref{Exa:#1} and~\ref{Exa:#2}}%
		\newcommand{\exrefsp}[3]{Exs.~\ref{Exa:#1}, \ref{Exa:#2} and~\ref{Exa:#3}}%
		\newcommand{\exrefspp}[4]{Exs.~\ref{Exa:#1}, \ref{Exa:#2}, \ref{Exa:#3} and~\ref{Exa:#4}}%
		\newcommand{\itemref}[1]{item~\ref{It:#1}}%
		\newcommand{\itemrefs}[2]{items~\ref{It:#1} and~\ref{It:#2}}%
		\newcommand{\itemrefsp}[3]{items~\ref{It:#1}, \ref{It:#2} and~\ref{It:#3}}%
		\newcommand{\itemrefspp}[4]{items~\ref{It:#1}, \ref{It:#2}, \ref{It:#3} and~\ref{It:#4}}%
		\newcommand{\itemseqref}[2]{items~\ref{It:#1}--\ref{It:#2}}%
		\newcommand{\Itemref}[1]{Item~\ref{It:#1}}%
		\newcommand{\Itemrefs}[2]{Items~\ref{It:#1} and~\ref{It:#2}}%
		\newcommand{\Itemrefsp}[3]{Items~\ref{It:#1}, \ref{It:#2} and~\ref{It:#3}}%
		\newcommand{\Itemrefspp}[4]{Items~\ref{It:#1}, \ref{It:#2}, \ref{It:#3} and~\ref{It:#4}}%
		\newcommand{\Itemseqref}[2]{Items~\ref{It:#1}--\ref{It:#2}}%
		\newcommand{\footnoteref}[1]{footnote~\ref{Footnote:#1}}%
		\newcommand{\footnoterefs}[2]{footnote~\ref{Footnote:#1} and~\ref{Footnote:#2}}%
		\newcommand{\obsref}[1]{Obs.~\ref{Obs:#1}}%
		\newcommand{\obsrefs}[2]{Obs.~\ref{Obs:#1} and~\ref{Obs:#2}}%
		\newcommand{\obsrefsp}[3]{Obs.~\ref{Obs:#1}, \ref{Obs:#2} and~\ref{Obs:#3}}%
		\newcommand{\obsrefspp}[4]{Obs.~\ref{Obs:#1}, \ref{Obs:#2}, \ref{Obs:#3} and~\ref{Obs:#4}}%
		\newcommand{\obsseqref}[2]{Obs.~[\ref{Obs:#1}]--[\ref{Obs:#2}]}%
		\newcommand{\remref}[1]{Remark~\ref{Rem:#1}}%
		\newcommand{\propref}[1]{Prop.~\ref{Prop:#1}}%
		\newcommand{\proprefs}[2]{Props.~\ref{Prop:#1} and~\ref{Prop:#2}}%
		\newcommand{\proprefsp}[3]{Props.~\ref{Prop:#1}, \ref{Prop:#2} and~\ref{Prop:#3}}%
	}
\else
	\RequirePackage{cleveref}
	\AtEndPreamble{%
		\crefname{theorem}{Thm.}{Thms.}%
		\crefname{lemma}{Lem.}{Lemmas}%
		\crefname{corollary}{Cor.}{Cors.}%
		\crefname{figure}{Fig.}{Figs.}%
		\crefname{definition}{Defn.}{Defns.}%
		\crefname{table}{Tab.}{Tabs.}%
		\crefformat{section}{\S#2#1#3}%
		\crefmultiformat{section}{\S#2#1#3}{ and~\S#2#1#3}{, \S#2#1#3}{ and~\S#2#1#3}%
		\crefname{example}{Ex.}{Exs.}%
		\crefname{item}{item}{item}%
		\crefname{footnote}{footnote}{footnote}%
		\crefname{observation}{Obs.}{Obs.}%
		\crefname{remark}{Remark}{Remarks}%
		\crefname{proposition}{Prop.}{Props.}%
	}
\fi
\IfFileExists{shortcuts.sty}{\RequirePackage{shortcuts}}{}
\ifx\TR@column\@TR@twocolumn
	\AtEndPreamble{%
	\setlist{nosep,leftmargin=\parindent}%
	}%
	\AtBeginDocument{%
	\setlength\abovedisplayskip{0.5\abovedisplayskip}%
	\setlength\belowdisplayskip{0.5\belowdisplayskip}%
	\setlength\abovedisplayshortskip{0.5\abovedisplayshortskip}%
	\setlength\belowdisplayshortskip{0.5\belowdisplayshortskip}%
	\setlength\floatsep{0.5\floatsep}%
	\def\MathparLineskip{\lineskip=0.29cm}%
}
\fi
