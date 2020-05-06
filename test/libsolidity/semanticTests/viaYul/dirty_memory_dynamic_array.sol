contract C {
    function f() public pure returns (bool correct) {
        uint8[] memory m = new uint8[](1);
        m[0] = uint8(0x0101);
        assembly {
            mstore(m, 257)
        }
        uint8 x = m[0];
        bool a = (m[0] == 0x01);
        bool b = (m[0] != 0x0101);
        bool c = (x == 0x01);
        bool d = (x != 0x0101);
        correct = a && b && c && d;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> true
