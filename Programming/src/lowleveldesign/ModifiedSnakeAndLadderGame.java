package lowleveldesign;


import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
import java.util.regex.*;
import java.util.stream.*;

import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

class Result {

    public static void writeTestCasesHere() {
        GameApplication gameApp = new GameApplicationImpl();
        Map<Integer, Integer> snakes = new HashMap<>();
        snakes.put(10, 2);
        Map<Integer, Integer> ladders = new HashMap<>();
        ladders.put(5, 14);
        List<Integer> players = new ArrayList<>();
        players.add(1);
        players.add(2);

        int gameId = gameApp.createGame(5, snakes, ladders, players);

        int playerId = gameApp.holdDice(gameId, 1);

        boolean sussessMove = gameApp.rollDiceAndMove(gameId, playerId);

        Game game = database.gamesMap.get(gameId);

    }
}

class database {
    public static Map<Integer, Game> gamesMap = new HashMap<>();

}

interface GameApplication {

    //return game id
    int createGame(int boardSize, Map<Integer, Integer> snakes, Map<Integer, Integer> ladders, List<Integer> playerIds);

    //return player id of the player for whom the dice is allocated
    int holdDice(int gameId, int playerId);

    //return false if any player who doesn't hold the dice calls this,
    // otherwise roll dice and move and return true
    boolean rollDiceAndMove(int gameId, int playerId);
}

class GameApplicationImpl implements GameApplication {

    //return game id
    public int createGame(int boardSize, Map<Integer, Integer> snakes, Map<Integer, Integer> ladders, List<Integer> playerIds) {

        Random random = new Random();
        int gameId = random.nextInt(9999999);
        Game game = new Game();
        game.gameId = gameId;
        game.boardSize = boardSize;
        game.snakes = snakes;
        game.ladders = ladders;

        game.playerIdToPlace = new HashMap<>();
        game.placeToPlayerIds = new HashMap<>();
        List<Player> players = new ArrayList<>();

        for (Integer playerId : playerIds) {
            Player player = new Player();
            player.playerId = playerId;
            player.position = 0;
            players.add(player);
            game.playerIdToPlace.put(playerId, 0);
            if (game.placeToPlayerIds.get(0) == null) {
                game.placeToPlayerIds.put(0, new ArrayList<>());
            }
            game.placeToPlayerIds.get(0).add(playerId);
            game.playerIdToPlace.put(playerId, 0);
        }
        game.players = players;


        database.gamesMap.put(gameId, game);
        return gameId;
    }

    //return player id of the player for whom the dice is allocated
    public synchronized int holdDice(int gameId, int playerId) {
        Game game = database.gamesMap.get(gameId);
        Player diceHolder = game.diceHolder;

        if (Objects.isNull(diceHolder)) {
            diceHolder = new Player();
            diceHolder.playerId = playerId;
        }
        game.diceHolder = diceHolder;
        return diceHolder.playerId;
    }

    //return false if any player who doesn't hold the dice calls this,
    // otherwise roll dice and move and return true
    public boolean rollDiceAndMove(int gameId, int playerId) {
        Game game = database.gamesMap.get(gameId);
        if (game.diceHolder == null || playerId != game.diceHolder.playerId) {
            return false;
        }

        Random random = new Random();
        int diceFace = random.nextInt(6);
        int existingPosition = game.playerIdToPlace.get(playerId);
        int nextPosition = existingPosition + diceFace;

        // Ahed of home - ignore move
        int boardSize = game.boardSize;
        if (nextPosition > boardSize * boardSize) {
            return true;
        }

        if (game.ladders.containsKey(nextPosition)) {
            nextPosition += game.ladders.get(nextPosition);
        } else if (game.snakes.containsKey(nextPosition)) {
            nextPosition -= game.ladders.get(nextPosition);
        }

        PositionAllocator positionAllocator = new PositionAllocatorImpl();

        if (!positionAllocator.canAllocate(gameId, nextPosition)) {
            if (game.placeToPlayerIds.get(nextPosition) == null) {
                game.placeToPlayerIds.put(nextPosition, new ArrayList<>());
            }
            game.placeToPlayerIds.get(nextPosition).add(playerId);
        }

        game.playerIdToPlace.put(playerId, nextPosition);

        return true;
    }

}

interface PositionAllocator {
    boolean canAllocate(int gameId, int position);
}

// Ignore second player
class PositionAllocatorImpl implements PositionAllocator {

    public boolean canAllocate(int gameId, int position) {
        Game game = database.gamesMap.get(gameId);
        if (game.placeToPlayerIds.containsKey(position)) {
            return false;
        }
        return true;
    }
}

class Game {
    int gameId;
    int boardSize;
    Map<Integer, Integer> snakes;
    Map<Integer, Integer> ladders;
    List<Player> players;
    Player diceHolder;
    Map<Integer, Integer> playerIdToPlace;
    Map<Integer, List<Integer>> placeToPlayerIds;
}

class Player {
    int playerId;
    int position;
}

public class ModifiedSnakeAndLadderGame {

    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        //int gameId = Integer.parseInt(bufferedReader.readLine().trim());

        //int playerId = Integer.parseInt(bufferedReader.readLine().trim());

        //int result = Result.holdDice(gameId, playerId);
        Result.writeTestCasesHere();

        bufferedWriter.write(String.valueOf(""));
        bufferedWriter.newLine();

        bufferedReader.close();
        bufferedWriter.close();
    }
}

