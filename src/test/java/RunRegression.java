import com.intuit.karate.junit5.Karate;

public class RunRegression {

    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@POST","@GET","@regression").relativeTo(getClass());
    }
}

