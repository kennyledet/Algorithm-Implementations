mport org.junit.Test;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.*;

public class TestStopWords {

    @Test
    public void testSearchForStopWord() {

        String testWord1 = "Aayush";
        String testWord2 = "Kumar";
        String testWord3 = "Srivastava";
        String testWord4 = "Random Text";
        String testWord5 = "Text";

        String[] listOfNames = {"Aayush","Kumar","Srivastava"};
        List<String> testString = Arrays.asList(listOfNames); // Converting Array into List of String

        assertEquals(StopWords.searchForStopWord(testWord1, testString), true);
        assertEquals(StopWords.searchForStopWord(testWord2,testString),true);
        assertEquals(StopWords.searchForStopWord(testWord3,testString),true);
        assertEquals(StopWords.searchForStopWord(testWord4,testString),false);
        assertEquals(StopWords.searchForStopWord(testWord5,testString),false);
    }

   @Test
    public void testReadStopWords() throws Exception {

       List<String> tokenizedText = StopWords.readStopWords("FILE_NAME");
       System.out.println(tokenizedText);
   }

   @Test
   public void testForRemoveStopWords() throws Exception {

       List<String> tokenizedText = StopWords.readStopWords("FILE_NAME");
       StopWords.removeStopWords("FILE_NAME",tokenizedText);
   }

}

