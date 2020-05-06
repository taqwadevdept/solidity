contract C {
    uint256[1] s;
    function f() public returns (bool correct) {
        // Emulate dirty bit
        s[0] = 1 << 255;
        assembly {
            // Clears dirty bit
            sstore(s_slot, 0xdeadbeef15dead)
        }
        uint32 x = uint32(s[0]);
        bool a = (s[0] == 0xdeadbeef15dead);
        bool b = (x == 0xef15dead);
        bool c = (s[0] != (uint(1 << 255) | uint(0xdeadbeef15dead)));
        bool d = (x != 0xdeadbeef15dead);
        correct = a && b && c && d;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> true
