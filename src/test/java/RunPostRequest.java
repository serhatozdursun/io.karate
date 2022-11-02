import com.intuit.karate.junit5.Karate;

public class RunPostRequest {

    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@POST").relativeTo(getClass());
    }
}
