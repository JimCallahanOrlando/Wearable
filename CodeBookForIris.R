# CodeBookForIris.R
# Jim Callahan
# Test program for codebook ideas.

# SAVE STRUCTURE
# Found capture.output while reading ?sink
# ?capture.output
str_iris <- capture.output(   str(iris)   )

# SAVE CONTENTS
# Found kable while google-ing for "R write to markdown"
# http://stackoverflow.com/questions/15488350/programmatically-creating-markdown-tables-in-r-with-knitr
library(knitr)
# iris[,1:5] is columns 1 to 5 of the iris data set endcol must be <= ncol
# head(item,2) is first 2 lines of item -- can vary the number as needed
KnitTable_iris1 <- kable( head(iris[,1:5],2), format = "markdown" )
KnitTable_iris2 <- kable( tail(iris[,1:5],2, addrownums = FALSE), format = "markdown" )

# OPEN FILE
mdFile = file("CodeBookForIris.md", "w") # open an output file connection

# WRITE TITLE
cat("## Code Book for the 'iris' data set  \n", file = mdFile)
cat("\n **iris** is an R ", file = mdFile)

# WRITE STRUCTURE
# ?write.line
writeLines(str_iris, mdFile)
                 

# WRITE CONTENTS
cat("\n First few lines of **iris**.  \n", file = mdFile)
writeLines(KnitTable_iris1, mdFile)
                

# WRITE CONTENTS
cat("\n Last few lines of **iris**.  \n", file = mdFile)
writeLines(KnitTable_iris2, mdFile)

# CLOSEFILE
close(mdFile)