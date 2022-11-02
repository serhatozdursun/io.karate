import com.intuit.karate.junit5.Karate;


public class RunSoapExamples {

    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@SOAP").relativeTo(getClass());
    }
}
