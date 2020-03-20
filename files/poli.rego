package actions.test
default hello = false

hello {
    m := data.message
    m == "world"
}
