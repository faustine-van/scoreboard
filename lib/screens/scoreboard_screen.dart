import 'package:material_ui/material_ui.dart';

class ScoreboardScreen extends StatefulWidget {
  const ScoreboardScreen({super.key});

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  int _scoreA = 0;
  int _scoreB = 0;

  Color _changeColor(bool isAboveZero) {
    return isAboveZero ? Colors.green : Colors.grey;
  }

  void _incrementScore(int score, bool isTeamA) {
    setState(() {
      if (isTeamA) {
        _scoreA = score;
      } else {
        _scoreB = score;
      }
    });
  }

  void _resetScore() {
    setState(() {
      _scoreA = 0;
      _scoreB = 0;
    });
  }

  void _decrementScore(int score, bool isTeamA) {
    if (score >= 0) {
      setState(() {
        if (isTeamA) {
          _scoreA = score;
        } else {
          _scoreB = score;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Score Board')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Match Scoreboard',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Team A', style: TextStyle(fontSize: 20)),
                Text(
                  '$_scoreA',
                  style: TextStyle(
                    fontSize: 20,
                    color: _changeColor(_scoreA > 0),
                  ),
                ),
                const Text(':'),
                Text(
                  '$_scoreB',
                  style: TextStyle(
                    fontSize: 20,
                    color: _changeColor(_scoreB > 0),
                  ),
                ),
                Text('Team B', style: TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _scoreA > 0 ? _decrementScore(_scoreA - 1, true) : null;
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.purple,
                    // shadowColor: Colors.purpleAccent,
                    elevation: 6,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('-'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    _incrementScore(_scoreA + 1, true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.blueAccent,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('+', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    _resetScore();
                  },
                  icon: const Icon(Icons.refresh),
                  label: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.purple,
                    // shadowColor: Colors.purpleAccent,
                    elevation: 6,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _scoreB > 0 ? _decrementScore(_scoreB - 1, false) : null;
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.purple,
                    // shadowColor: Colors.purpleAccent,
                    elevation: 6,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('-'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    _incrementScore(_scoreB + 1, false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shadowColor: Colors.purpleAccent,
                    elevation: 6,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('+', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
