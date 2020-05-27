contract C {
	function f() pure public {
		assembly {
			pop(pc())
		}
	}
}
// ----
// TypeError: (61-63): The "pc" instruction is not available in Yul for any VMs (you are currently compiling for "istanbul").
