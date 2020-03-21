package action_test

test_default {
    not data.actions.test.hello
}

test_default_fail {
    not data.actions.test.hi
}
