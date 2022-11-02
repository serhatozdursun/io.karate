import com.intuit.karate.junit5.Karate;

public class RunGetRequests {
    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@GET").relativeTo(getClass());    }

}
