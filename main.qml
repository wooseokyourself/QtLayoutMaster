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
        Layout.fillWidth: true; Layout.preferredHeight: parent.height * 0.4
        orientation: Qt.Horizontal
      } // ComponentSplitView
      ComponentResizableView { id: componentResizableView
        Layout.fillWidth: true; Layout.preferredHeight: parent.height * 0.4
      }
      Pane {
        RowLayout {
          Button {
            text: "Add empty stack"
            onClicked: {
              componentSplitView.addObject(stackLayoutComponent.createObject())
              componentResizableView.addObject(
                stackLayoutComponent.createObject(componentResizableView, {x: 100, y: 100, width: 300, height: 300}))
            }
          } // Button
          Button {
            text: "Add stack with 3 item"
            onClicked: {
              var stackLayout1 = stackLayoutComponent.createObject()
              stackLayout1.addComponent("Rect1", rectComponent)
              stackLayout1.addComponent("Label", labelComponent)
              stackLayout1.addComponent("Rect2", rectComponent)
              componentSplitView.addObject(stackLayout1)
              
              var stackLayout2 = stackLayoutComponent.createObject(componentResizableView, {x: 100, y: 100, width: 300, height: 300})
              stackLayout2.addComponent("Rect1", rectComponent)
              stackLayout2.addComponent("Label", labelComponent)
              stackLayout2.addComponent("Rect2", rectComponent)
              componentResizableView.addObject(stackLayout2)
            }
          } // Button
        } // RowLayout
      } // Pane
    } // ColumnLayout
  } // Pane
} // Window
