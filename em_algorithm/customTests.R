# Put custom tests in this file.

# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Get the last expression which the user entered at the R console.
getExpr <- function(){
  getState()$expr
}

mu_test <- function(){
  val <- getVal()
  expr_string <- deparse(getExpr())
  isTRUE(all.equal(val, rep(c(0,3),each=250))) &&
    isTRUE(grepl("^mu", expr_string)) &&
    !isTRUE(grepl("^mu[:alnum:]", expr_string))
}