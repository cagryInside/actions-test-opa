package actions.test
default hello = false
default hii = false

hello {
    m := data.message
    m == "world"
}
