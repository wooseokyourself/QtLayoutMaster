import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

Pane {
	property alias orientation: splitView.orientation

	//function addComponent(component) {
	//	listModel.append( {component} )
	//}

	function addObject(object) {
		object.parent = splitView
		listModel.append( object )
	}

	SplitView { id: splitView
		anchors.fill: parent
		Repeater {
			model: ListModel {
				id: listModel
			} // ListModel
			
			//delegate: Loader { 
			//	sourceComponent: component
			//} // Loader
			
		} // Repeater
	} // SplitView
} // Pane
