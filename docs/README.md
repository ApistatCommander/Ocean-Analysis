
# The `/docs` Directory

All of our project reports can be found in this directory. Our key reports are
as follows:


|Report | Brief Description|
|---------------| -----------------|
|[Project Proposal](./p01-proposal.md) | Our project proposal: "Ocean Plastic: Where does it come from and what does that mean for us?" Describes our environmental concern about the plastic pollution in the ocean.
|[Exploratory Data Analysis](./index.html) | Exploratory Data Analysis of Ocean Plastic and Pollution.
|[Interactive Vizualizaiton](./xxx) | A brief description of your final report.

## DEVELOPER Note 1
`/docs`

* Use the `/docs` directory to organize all for your R Markdown files, which have the extension `.Rmd`.
* Your R Markdown files are used to create reports that can be published on the web as HTML files.  That is, R Markdown (.Rmd) --> web page (.html) --> Published on GitHub in your `/docs` directory.
* This is the basic workflow:
  - Go to RStudio
  - File > New file > R Markdown
  - Edit the file
  - Save the file in `/docs`
  - From RStudio, Knit the file (this creates an HTML file for publishing)
  - Push your `/docs` directory to your GitHub repository
* Once you push your `/docs` directory, you can view your reports in a web browser by using an URL like this: `https://info-201a-wi22.github.io/final-project/xxx/index.html`

Where:
1. `info-201a-wi22`    is the organization
1. `github.io`         is a webserver that GitHub makes available to us
1. `final-project`     is the repository name
1. `xxx`               is your GitHub username
1. `index.htlm`        is the document you would like to view

## DEVELOPER Note 2: IMPORTANT: Setting up your webserver
1. You must make your repository *public*. To make it public: Go to your GitHub repository > Settings (top-right) > Change visibility (Danger Zone) > Make Public
1. You must set the pages source to /docs. To do so: Got your GitHub repository > Pages (bottom-left) > Select "/docs" from the pulldown menu
1. If you run into trouble, pleaes ask your TA or post on Teams - as usual, it is straigthforward once you know how but can be tricky to figure out the first time.
