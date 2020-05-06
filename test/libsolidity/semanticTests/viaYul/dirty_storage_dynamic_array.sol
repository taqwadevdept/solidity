contract C {
    uint8[] s;
    function f() public returns (bool correct) {
        s.push(uint8(0x0101));
        assembly {
            sstore(s_slot, 257)
        }
        uint8 x = s[0];
        bool a = (s[0] == 0x01);
        bool b = (s[0] != 0x0101);
        bool c = (x == 0x01);
        bool d = (x != 0x0101);
        correct = a && b && c && d;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> true
