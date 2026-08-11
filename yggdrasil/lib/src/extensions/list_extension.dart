extension ListExtension<E> on List<E> {
  List<E> longestCommonSublist(List<E> other) {
    final int m = length;
    final int n = other.length;

    // Create a DP table filled with 0
    final List<List<int>> dp = List<List<int>>.generate(m + 1, (_) => List<int>.filled(n + 1, 0));

    // Fill the DP table
    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (this[i - 1] == other[j - 1]) {
          // Include the matching element
          dp[i][j] = 1 + dp[i - 1][j - 1];
        } else {
          // Take max from top or left
          dp[i][j] = dp[i - 1][j].clamp(dp[i][j - 1], double.infinity).toInt();
        }
      }
    }

    // Backtrack to get the actual LCS list
    int i = m, j = n;
    final List<E> lcs = <E>[];

    while (i > 0 && j > 0) {
      if (this[i - 1] == other[j - 1]) {
        // Insert at the beginning (avoids reversing later)
        lcs.insert(0, this[i - 1]);
        i--;
        j--;
      } else if (dp[i - 1][j] >= dp[i][j - 1]) {
        // Move up
        i--;
      } else {
        // Move left
        j--;
      }
    }

    return lcs;
  }
}
