import java.util.*;
import java.io.*;

public class StopWords {

    private static String OUTPUT_FILE = "YOUR_FILE_LOCATION";

    public static Boolean searchForStopWord(String word, List<String> textForCheck) {

        int indexOfWord = Collections.binarySearch(textForCheck,word);

        if(indexOfWord < 0)
            return false;
        else
            return true;
    }

    public static List<String> readStopWords(String stopWordsFilename) throws Exception {

            FileInputStream fStream = new FileInputStream(stopWordsFilename);

            DataInputStream dataStreamObject = new DataInputStream(fStream);
            BufferedReader objectForBuffer = new BufferedReader(new InputStreamReader(dataStreamObject));

            String strLine;
            String oneLinerString = "";

            while ((strLine = objectForBuffer.readLine()) != null) {
                strLine.trim();
                oneLinerString = oneLinerString + "," + strLine;
            }

            List<String> tokenizedList = Arrays.asList(oneLinerString.split(","));
            fStream.close();

            return tokenizedList;
     }

    public static void removeStopWords(String textFilename, List<String> stopWords)  {

        try {
            FileOutputStream outputStream = new FileOutputStream(OUTPUT_FILE);
            PrintStream outputFileWriter = new PrintStream(outputStream);

            FileInputStream fStream = new FileInputStream(textFilename);
            DataInputStream dataStreamObject = new DataInputStream(fStream);
            BufferedReader objectForBuffer = new BufferedReader(new InputStreamReader(dataStreamObject));

            String strLine;

            while ((strLine = objectForBuffer.readLine()) != null) {

                boolean flag = false;

                List<String> tokenizedList = Arrays.asList(strLine.split("([^a-zA-z0-9])"));

                for(int i=0;i<tokenizedList.size();i++) {

                    flag = searchForStopWord(tokenizedList.get(i), stopWords);

                    if (!flag)
                        outputFileWriter.print(tokenizedList.get(i)+" ");

                    flag = false;
                }

                outputFileWriter.print("\n");
            }
        }

        catch(Exception e){
            System.err.println(e.getMessage());
         }
    }

    public static void main(String[] arg) throws Exception {

        Scanner keyboard = new Scanner(System.in);

        System.out.print("Please type stop words file name: ");
        List<String> stopWords = readStopWords(keyboard.next());

        System.out.print("Please type text file name: ");
        removeStopWords(keyboard.next(), stopWords);

    }
}

