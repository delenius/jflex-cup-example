package com.github.delenius;

import org.junit.Assert;
import org.junit.Test;

import java.io.StringReader;

public class CalcTest {

    String text = "3 + (4 * 6)";

    @Test
    public void testCUPParser() throws Exception {
        int r = CalcParser.getResult(new StringReader(text));
        Assert.assertEquals(27,r);
    }

}
