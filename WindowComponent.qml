import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.2


Component { id: windowComponent
	ApplicationWindow { id: window
		visible: true
		width: 400; height: 400
		
		Button { 
			onClicked: console.log(window.contentData.length + "/" + window.contentData[0].width + " X " + window.contentData[0].height) 
		}
		
		/*

		property alias component: loader.sourceComponent
		Loader { id: loader; anchors { fill: parent } }
		*/

	/*
		function setObject(object) {
			console.log("setObject called, listModel=" + listModel.count)
			while (listModel.count > 0)
				listModel.pop()
			object.parent = splitView
			listModel.append(object)
			console.log("after, listModel=" + listModel.count + " / " + object.width  + "x" + object.height)
		}
				
		SplitView { id: splitView
			anchors.fill: parent
			Button { 
				onClicked: console.log(listModel.count) 
			}
			Repeater {
				model: ListModel {
					id: listModel
				} // model
			} // Repeater
		} // SplitView
		*/
	} // Window
} // Component