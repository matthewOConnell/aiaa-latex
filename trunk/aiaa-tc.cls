%%
% AIAA class for technical conference papers.
%  by Bil Kleb and Bill Wood
%
% TODO:
% - references to section numbers

\NeedsTeXFormat{LaTeX2e}[1994/12/01]

\ProvidesClass{aiaa-tc}[2007/09/19 v4.0.0 AIAA technical conference paper]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}%
                \typeout{Unknown option: passing ``\CurrentOption"
                         option on to the underlying LaTeX article class.}}
\ProcessOptions

\LoadClass[letterpaper,twoside,10pt]{article}

%%
% page layout

\RequirePackage[margin=1in,top=0.75in,headheight=\baselineskip]{geometry}

%%
% accommodate images

\RequirePackage{graphicx}

% defaults
\setkeys{Gin}{ width=\linewidth, totalheight=\textheight, keepaspectratio }

\RequirePackage{overcite}% superscript, sorted, compressed citation commands

\RequirePackage{lastpage}% to get reference for last page number

\RequirePackage{fancyhdr}% simple control of headers and footers

\def\fps@figure{htbp}
\def\fps@table{htbp}

\fancyhf{}% clear defaults
\renewcommand{\headrulewidth}{0pt}% turn off default headrule
\cfoot{\footnotesize\normalfont
       \thepage~of~\pageref{LastPage}\\
       \rule[.2\baselineskip]{0.5in}{0.2pt}\\
        American Institute of Aeronautics and Astronautics}

\pagestyle{fancy}

\renewenvironment{abstract}%
  {\small\quotation\bfseries}%
  {\normalfont\endquotation\normalsize}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\footnotesize\bfseries #1.~~#2}%
  \ifdim \wd\@tempboxa >\hsize
    \footnotesize\bfseries #1.~~#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\setlength\belowcaptionskip{5pt plus 1pt minus 1pt}

\renewcommand\thesection      {\@Roman\c@section}
\renewcommand\thesubsection   {\@Alph\c@subsection}
\renewcommand\thesubsubsection{\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\@alph\c@paragraph}
\renewcommand\thesubparagraph {\@roman\c@subparagraph}
\setcounter{secnumdepth}{3}% no counters \paragraph and below
\def\@seccntformat#1{\csname the#1\endcsname.\quad}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\center\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\normalsize\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                      {2.25ex \@plus1ex \@minus.2ex}%
                                      {-1em}%
                                      {\normalfont\normalsize\scshape}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                         {2.25ex \@plus1ex \@minus .2ex}%
                                         {-1em}%
                                         {\normalfont\normalfont}}

\renewcommand{\@biblabel}[1]{$^{#1}$}

\renewenvironment{thebibliography}[1]%
     {\section*{\refname}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\setlength{\leftmargin}{0pt}%
            \settowidth{\labelwidth}{\@biblabel{#1}}%
            \setlength{\itemindent}{\parindent}%
            \advance\itemindent by \labelwidth%
            \setlength{\labelsep}{0.0em}%
            \setlength{\itemsep}{-\smallskipamount}%
            \@openbib@code%
            \usecounter{enumiv}%
            \let\p@enumiv\@empty%
            \renewcommand\theenumiv{\@arabic\c@enumiv}%
            \footnotesize%
            }
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
      {\def\@noitemerr
        {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
