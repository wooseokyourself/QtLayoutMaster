import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

Window {
  visible: true
  width: 640
  height: 480
  title: qsTr("Hello World")
  
  StackLayoutComponent { id: stackLayoutComponent }

  Component { id: rectComponent
		Rectangle { 
			color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
		} // Rectangle
	} // Component

	Component { id: labelComponent
		Label { 
			text: "Label " + Math.random()
			font.pointSize: 14
		} // Label
	} // Component

  Pane { anchors.fill: parent
    ColumnLayout { anchors.fill: parent
      ComponentSplitView { id: componentSplitView
        Layout.fillWidth: true; Layout.fillHeight: true
        orientation: Qt.Horizontal
      } // FreeLayoutSpace
      Pane {
        RowLayout {
          Button {
            text: "Add empty stack"
            onClicked: componentSplitView.addObject(
              stackLayoutComponent.createObject())
          } // Button
          Button {
            text: "Add stack with 3 item"
            onClicked: {
              var stackLayout = stackLayoutComponent.createObject()
              stackLayout.addComponent("Rect1", rectComponent)
              stackLayout.addComponent("Label", labelComponent)
              stackLayout.addComponent("Rect2", rectComponent)
              componentSplitView.addObject(stackLayout)
            }
          } // Button
        } // RowLayout
      } // Pane
    } // ColumnLayout
  } // Pane
} // Window
