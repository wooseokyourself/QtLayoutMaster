import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

Pane {
	property alias content: loader.sourceComponent
	Loader { id: loader
		anchors { fill: parent }
		// sourceComponent: Pane {}
	} // Loader
} // Pane