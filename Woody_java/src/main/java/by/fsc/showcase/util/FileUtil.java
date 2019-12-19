package by.fsc.showcase.util;

import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileUtil {
    public static void processFile(int id, Part part) throws IOException {
        Path filePath = Paths.get("./src/main/webapp/static/items/" + id + ".jpg");
        Files.createDirectories(filePath.getParent());
        Files.deleteIfExists(filePath);
        Files.copy(part.getInputStream(), filePath);
    }


    public static void processFile(String name, Part part) throws IOException {
        Path filePath = Paths.get("./src/main/webapp/static/pictures/" + name);
        Files.createDirectories(filePath.getParent());
        Files.deleteIfExists(filePath);
        Files.copy(part.getInputStream(), filePath);
    }


    public static void removeFile(int id) throws IOException {
        Path filePath = Paths.get("./src/main/webapp/static/items/" + id + ".jpg");
        Files.deleteIfExists(filePath);
    }
}
