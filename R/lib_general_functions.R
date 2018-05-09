# nmfy = function(...)
# {
#   l = list(...)
#   # print(l)
#   print(match.call())
#   # print(match.arg(arg = '...', choices = '...'))
# }



obj_has_clusters = function(x)
{
  if(is.null(x$cluster))
    stop('Cannot proceed without having computed clusters -- are you calling the right function?')
}

obj_has_fit = function(x)
{
  if(is.null(x$fit))
    stop('Cannot proceed without having computed fit models -- are you calling the right function?')
}

obj_has_evodistance = function(x)
{
  if(is.null(x$cluster$distances))
    stop('Cannot proceed without having computed the evolutionary distance -- are you calling the right function?')
}


obj_has_trees = function(x)
{
  if(is.null(x$cluster$phylogenies))
    stop('Cannot proceed without having computed the trees -- are you calling the right function?')
}


saveFile = function(descr, fname, ...)
{
  save(..., file = fname)

  if(!is.na(descr))
  {
    cat(crayon::cyan(descr), '\n')

    stat = file.info(fname, extra_cols = FALSE)
    stat$size = utils:::format.object_size(stat$size, "auto")
    stat$isdir = NULL
    stat$ctime = stat$atime = NULL

    print(stat)
    cat(crayon::cyan("Path:"), getwd(), '\n')
  }

}



#
#   "distances"        "transfer"         "dist.obj"         "distances.params" "hc"
#   [6] "dendogram"        "clusters"         "k"                "split.method"     "labels.colors"
#
#   > names(cohort)
#   [1] "patients"          "variantIDs"        "variantIDs.driver" "numVariants"       "annotation"
#   [6] "dataset"           "CCF.parser"        "REVOLVER_VERSION"  "phylogenies"       "fit"
#   [11] "cluster"           "jackknife"
#
# }