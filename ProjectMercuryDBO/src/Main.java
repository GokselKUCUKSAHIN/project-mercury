import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.stage.Stage;

import java.sql.SQLException;
import java.util.ArrayList;

public class Main extends Application
{
    int width = 800;
    int height = 800;


    @Override
    public void start(Stage stage) throws Exception
    {
        Pane root = new Pane();
        //
        System.out.println(DBO.getColumnName(DBO.findFirstNull(1)));

        //
        stage.setScene(new Scene(root,width,height, Color.rgb(51,51,51)));
        stage.setTitle("MERCURY PROJECT DB");
        stage.setResizable(false);
        stage.show();
    }

    public static void main(String[] args)
    {
        launch();
    }
}

/*

ArrayList<String> rs = new ArrayList<>();
        try
        {
            rs = DBO.test();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        for (String str : rs)
        {
            System.out.println(str);
        }
 */