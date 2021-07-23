package samples

import "testing"

func TestHello(t *testing.T) {
	actual := hello()
	expect := "Hello, world"

	if actual != expect {
		t.Errorf("actual %q expect %q", actual, expect)
	}

}
