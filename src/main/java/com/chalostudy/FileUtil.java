package com.chalostudy;

import jakarta.servlet.*;
import java.io.*;
import java.nio.file.*;
import java.util.*;

public class FileUtil {
    /* return file-names inside uploads/SUBJECT/CATEGORY/ */
    public static List<String> list(String subject, String category, ServletContext ctx) {
        Path dir = Paths.get(ctx.getRealPath("/"), "uploads", subject, category);
        if (!Files.exists(dir))
            return Collections.emptyList();
        try {
            return Files.list(dir)
                    .map(p -> p.getFileName().toString())
                    .sorted()
                    .toList();
        } catch (IOException e) {
            return Collections.emptyList();
        }
    }
}