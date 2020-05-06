contract C {
    function f() public pure returns (bool correct) {
        uint256[1] memory m;
        // Emulate dirty bit
        m[0] = 1 << 255;
        assembly {
            // Clears dirty bit
            mstore(m, 0xdeadbeef15dead)
        }
        uint32 x = uint32(m[0]);
        bool a = (m[0] == 0xdeadbeef15dead);
        bool b = (x == 0xef15dead);
        bool c = (m[0] != (uint(1 << 255) | uint(0xdeadbeef15dead)));
        bool d = (x != 0xdeadbeef15dead);
        correct = a && b && c && d;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> true
