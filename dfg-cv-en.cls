\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{dfg_cv}
\LoadClass[11pt,a4paper]{scrartcl}

%%% DFG format specifics
\RequirePackage[a4paper,left=2.5cm,textwidth=16.5cm,top=2.5cm,textheight=25.7cm]{geometry} % Seitenränder aus rtf konvertiert (paperw11900/paperh16840/margl1418/margr1134/margb851/margt1418)
\pagestyle{empty} % disable pagenumbering
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage[english,main=german]{babel}
\RequirePackage[german=quotes]{csquotes}


% Use helvet to be close to Arial (<- required by DFG)
\RequirePackage[scaled=.95]{helvet} % Do not scale smaller than .95! smaller factors violate the DFG requirement that Arial 11pt may not be undercut
\renewcommand\familydefault{phv}

\RequirePackage{sectsty}
\allsectionsfont{\normalsize} % Let headings have the same size as the rest of the text
\RequirePackage{enumitem} % for compact itemize/enumerate

\RequirePackage{varwidth}
\RequirePackage{tabularray}

%% Disable all "continue on next page"-captions produced by longtblr
\DefTblrTemplate{contfoot-text}{default}{}
\DefTblrTemplate{conthead-text}{default}{}
\DefTblrTemplate{caption}{default}{}
\DefTblrTemplate{conthead}{default}{}
\DefTblrTemplate{capcont}{default}{}

\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.2} % Zeilenabstand 1.2
\RequirePackage{ragged2e} % Kein Blocksatz in Tabelle
\RequirePackage{soul} % Underline with overlap (vs. \underline)
\setuldepth{www.de/}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=MY,prefix=MY@}
\newcommand{\dcheck}{~~}

% Have an option that allows to check the checkbox in the data protection declaration
\DeclareBoolOption{checked}
\DeclareBoolOption{walterbenjamin}

\ProcessKeyvalOptions*

\ifMY@checked
  \renewcommand{\dcheck}{\,X\,}
\fi


%% Have tables with thicker border
\newcommand{\vthick}{1pt}
\newcommand{\thick}{0.8pt}
\RequirePackage{tabularx}
\RequirePackage{xltabular}
\RequirePackage{makecell}
\RequirePackage{array}

\newcolumntype{?}{!{\vrule width \vthick}}
\newcolumntype{+}{!{\vrule width \thick}}


\DeclareRobustCommand\actitle[1]{\gdef\@actitle{#1}}
\DeclareRobustCommand\vorname[1]{\gdef\@vorname{#1}}
\DeclareRobustCommand\nachname[1]{\gdef\@nachname{#1}}
\DeclareRobustCommand\position[1]{\gdef\@position{#1}}
\DeclareRobustCommand\institution[1]{\gdef\@institution{#1}}
\DeclareRobustCommand\orcid[1]{\gdef\@orcid{#1}}
\DeclareRobustCommand\schule[1]{\gdef\@schule{#1}}
\DeclareRobustCommand\studium[1]{\gdef\@studium{#1}}
\DeclareRobustCommand\promotion[1]{\gdef\@promotion{#1}}
\DeclareRobustCommand\stationen[1]{\gdef\@stationen{#1}}



%%% DFG content specfics
\AtBeginDocument{
    \section*{Curriculum Vitae}
    \section*{Personal Data}

    % Persönliche Daten - Tabelle
    \begin{tabularx}{\textwidth}{?p{5.24cm}+X?}\Xhline{\vthick}
        Title & \@actitle  \\ \Xhline{\thick}
        First Name & \@vorname \\ \Xhline{\thick}
        Name & \@nachname \\ \Xhline{\thick}
        Current position & \@position \\ \Xhline{\thick}
        Current institution(s)/site(s), country& \@institution \\ \Xhline{\thick}
        Identifiers/ORCID & \@orcid \\
    \Xhline{\vthick}\end{tabularx}


    % Qualifizierung und Werdegang - Tabelle
    \section*{Qualifications and Career}
    \begin{tabularx}{\textwidth}{?p{5.24cm}+X?}\Xhline{\vthick}
        \textbf{Stages} & \textbf{Periods and Details} \\ \Xhline{\thick}
        \ifMY@walterbenjamin
            School, country & \@schule \\ \Xhline{\thick}
        \fi
            Degree programme & \@studium \\ \Xhline{\thick}
            Doctorate & \@promotion \\ \Xhline{\thick}
            Stages of academic/professional career & \@stationen \\
    \Xhline{\vthick}\end{tabularx}
}




% --- Ergänzende Angaben zum Werdegang ---
\newcommand{\secWerdegang}{\section*{Supplementary Career Information}} % optional, Freitextfeld

% --- Engagement im Wissenschaftssystem ---
\newcommand{\secEngagement}{\section*{Engagement in the Research System}} % optional, Freitextfeld

% --- Betreuung von Forschenden in frühen Karrierephasen ---
\newcommand{\secBetreuung}{\section*{Supervision of Researchers in Early Career Phases}} % optional, Freitextfeld

% --- Wissenschaftliche Ergebnisse ---
\newcommand{\secErgebnisse}{\section*{Scientific Results}} % Teil A obligatorisch, Teil B optional, Freitextfelder

% --- Kategorie A ---
\newcommand{\secKatA}{\section*{Category A}} % obligatorisch, Freitextfeld

% --- Kategorie B ---
\newcommand{\secKatB}{\section*{Category B}} % optional, Freitextfeld


% --- Anerkennung durch das Wissenschaftssystem ---
\newcommand{\secAnerkennung}{\section*{Academic Distinctions}} % optional, Freitextfeld

% --- Sonstige Angaben --- 
\newcommand{\secSonstiges}{\section*{Other Information}} % optional, Freitextfeld

% --- Datenschutz und Einwilligung in die Verarbeitung optionaler Angaben ---
\AtEndDocument{\section*{Data protection and consent to the processing of optional data}
{\small
If you provide voluntary information (marked as optional) in this CV, your consent is required. Please confirm your consent by checking the box below.

\vspace{.4\baselineskip}

\noindent \textbf{[\dcheck] I expressly consent to the processing of the voluntary (optional) information, including \enquote{special categories of personal data} in connection with the DFG’s review and decision-making process regarding my proposal.}
This also includes forwarding my data to the external reviewers, committee members and, where applicable, foreign partner organisations who are involved in the decision-making process. To the extent that these recipients are located in a third country (outside the European Economic Area), I additionally consent to them being granted access to my data for the above-mentioned purposes, even though a level of data protection comparable to EU law may not be guaranteed. For this reason, compliance with the data protection principles of EU law is not guaranteed in such cases. In this respect, there may be a violation of my fundamental rights and freedoms and resulting damages. This may make it more difficult for me to assert my rights under the General Data Protection Regulation (e.g. information, rectification, erasure, compensation) and, if necessary, to enforce these rights with the help of authorities or in court.

\vspace{.4\baselineskip} 

\noindent I may \textbf{revoke} my consent in whole or in part at any time – with effect for the future, freely and without giving reasons – vis-à-vis the DFG (\ul{postmaster@dfg.de}). The lawfulness of the processing carried out up to that point remains unaffected. Insofar as I transmit “special categories of personal data” relating to third parties in this CV, I confirm that the necessary legitimation under data protection law exists (e.g. based on consent).

\vspace{.4\baselineskip} 

\noindent I have taken note of the DFG’s Data Protection Notice relating to research funding, which I can access at \ul{www.dfg.de/privacy\_policy} and I will forward it to such persons whose data the DFG processes as a result of being mentioned in this CV.}}


%%% MISC
\newenvironment{compactItemize}
{
\begin{itemize}[noitemsep,nolistsep,leftmargin=*]
}
{
\end{itemize}
}
\newenvironment{compactEnumerate}
{
\begin{enumerate}[noitemsep,nolistsep,leftmargin=2em]
}
{
\end{enumerate}
}

\newcommand{\optionaltext}{\textcolor{blue}{\textbf{optionales Freitextfeld --  siehe für weitere Informationen: \url{https://www.dfg.de/formulare/53_200_elan/53_200_de_elan.rtf} }}}
\newcommand{\semioptionaltext}{\textcolor{orange}{\textbf{optionales Freitextfeld (außer für Graduiertenkollegs) --  siehe für weitere Informationen: \url{https://www.dfg.de/formulare/53_200_elan/53_200_de_elan.rtf} }}}
