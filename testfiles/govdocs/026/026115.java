/**
 * Class: TreeTableSearchResponseView
 *
 * Date: Mar 9, 2004 5:02:00 PM
 *
 * Copyright:
 *    Copyright (c) 2003, The Regents of the University of California,
 *    through Lawrence Berkeley National Laboratory (subject to receipt
 *    of any required approvals from the U.S. Dept. of Energy).
 *    All rights reserved.
 */
package gov.lbl.dsd.scishare.gui.search;

import gov.lbl.dsd.scishare.api.SearchResponseObserver;
import gov.lbl.dsd.scishare.api.SearchHandle;
import gov.lbl.dsd.scishare.gui.util.treetable.TreeTableModelAdapter;
import gov.lbl.dsd.scishare.gui.util.treetable.AbstractCellEditor;
import gov.lbl.dsd.scishare.gui.util.treetable.TreeTableModel;
import gov.lbl.dsd.scishare.util.ScishareLog;
import gov.lbl.dsd.rdmf.elements.*;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.tree.*;
import javax.swing.table.TableCellEditor;
import javax.swing.table.TableCellRenderer;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.util.EventObject;
import java.util.Date;
import java.util.Iterator;

/**
 * This class represents the view fro the tree table of serch results
 * @author Artur Muratas
 * @version $Revision: 1.8 $
 */
public class TreeTableSearchResponseView extends JTable implements SearchResponseObserver {

    /** A subclass of JTree. */
    protected TreeTableCellRenderer tree;
    private TreeTableSearchResponseModel ttsrm;
    private TreeTableModelAdapter tma;
    private ListToTreeSelectionModelWrapper selectionWrapper;

    public TreeTableSearchResponseView(TreeTableModel treeTableModel) {
        super();
        ttsrm = (TreeTableSearchResponseModel) treeTableModel;
        // Create the tree. It will be used as a renderer and editor.
        tree = new TreeTableCellRenderer(treeTableModel);

        // Install a tableModel representing the visible rows in the tree.
        tma = new TreeTableModelAdapter(treeTableModel, tree);
        super.setModel(tma);

        // Force the JTable and JTree to share their row selection models.
        selectionWrapper = new ListToTreeSelectionModelWrapper();
        tree.setSelectionModel(selectionWrapper);
        setSelectionModel(selectionWrapper.getListSelectionModel());
        setRowSelectionAllowed(true);

        // Install the tree editor renderer and editor.
        setDefaultRenderer(TreeTableModel.class, tree);
        setDefaultEditor(TreeTableModel.class, new TreeTableCellEditor());

        DefaultTreeCellRenderer renderer = new DefaultTreeCellRenderer();
        renderer.setLeafIcon(null);
        tree.setCellRenderer(renderer);

        // No grid.
        setShowGrid(false);

        // No intercell spacing
        setIntercellSpacing(new Dimension(0, 0));

        // And update the height of the trees row to match that of the table.
        if (tree.getRowHeight() < 1) {
            setRowHeight(18);
        }
    }

    // added 7/30/03 jlai
    public void setModel(TreeTableModel treeTableModel) {
        ttsrm = (TreeTableSearchResponseModel) treeTableModel;

        // Create the tree. It will be used as a renderer and editor.
        tree = new TreeTableCellRenderer(treeTableModel);
        // Install a tableModel representing the visible rows in the tree.
        tma = new TreeTableModelAdapter(treeTableModel, tree);
        super.setModel(tma);

        // Force the JTable and JTree to share their row selection models.
        selectionWrapper = new ListToTreeSelectionModelWrapper();
        tree.setSelectionModel(selectionWrapper);
        setSelectionModel(selectionWrapper.getListSelectionModel());

        // Install the tree editor renderer and editor.
        setDefaultRenderer(TreeTableModel.class, tree);
        setDefaultEditor(TreeTableModel.class, new TreeTableCellEditor());

        DefaultTreeCellRenderer renderer = new DefaultTreeCellRenderer();
        renderer.setLeafIcon(null);
        tree.setCellRenderer(renderer);
        setShowGrid(false);
        setIntercellSpacing(new Dimension(0, 0));

        // And update the height of the trees row to match that of the table.
        if (tree.getRowHeight() < 1) {
            setRowHeight(18);
        }
    }

    public TreeTableSearchResponseModel getTreeTableModel() {
        return ttsrm;
    }

    public void addRow(Object[] row) {
        ttsrm.addRow(row);
        this.fireTreeTableDataChanged();
    }

    /**
     * Overridden to message super and forward the method to the tree.
     * Since the tree is not actually in the component hieachy it will
     * never receive this unless we forward it in this manner.
     */
    public void updateUI() {
        super.updateUI();
        if (tree != null) {
            tree.updateUI();
        }
        // Use the tree's default foreground and background colors in the table.
        LookAndFeel.installColorsAndFont(this, "Tree.background",
                "Tree.foreground", "Tree.font");
    }

    /* Workaround for BasicTableUI anomaly. Make sure the UI never tries to
     * paint the editor.
     */
    public int getEditingRow() {
        return (getColumnClass(editingColumn) == TreeTableModel.class) ? -1 : editingRow;
    }

    /**
     * Overridden to pass the new rowHeight to the tree.
     */
    public void setRowHeight(int rowHeight) {
        super.setRowHeight(rowHeight);
        if (tree != null && tree.getRowHeight() != rowHeight) {
            tree.setRowHeight(getRowHeight());
        }
    }

    public Object getRowObject(int row) {
        return tma.nodeForRow(row);
    }

    /**
     * Returns the tree that is being shared between the model.
     */
    public JTree getTree() {
        return tree;
    }

    public void sortAllRowsBy(int col, boolean ascending) {
        ttsrm.sortAllRowsBy(col, ascending);
    }

    // update the tree table
    public void fireTreeTableDataChanged() {
        tma.fireTableDataChanged();
        tree.treeDidChange();
        tree.updateUI();
    }

    public void handleResponse(SearchHandle handle, ItemDescription itemDesc) {
        if (itemDesc.getType().equals(ItemType.FILE)) {
            Object[] ob = new Object[8];
            ob[0] = itemDesc.getName();
            ob[1] = itemDesc.getDescription();
            ob[2] = new Long(itemDesc.getValue(ItemDescriptionFactory.FILE_LENGTH));
            ob[3] = new Date(Long.parseLong(itemDesc.getValue(ItemDescriptionFactory.FILE_LAST_MODIFIED)));
            Iterator it = itemDesc.serviceDescriptions();
            while (it.hasNext()) {
                ServiceDescription sd = (ServiceDescription) it.next();
                if (sd != null) {
                    ob[4] = sd.getAddress();
                    break;
                }
            }
            String userIdentity = itemDesc.getAttribute("USER IDENTITY").getValue();
            if (userIdentity.indexOf("CN=Pseudo User") != -1) {
                userIdentity = "PSEUDO USER";
            }
            ob[5] = userIdentity;
            ob[6] = itemDesc.getAttribute("TRUSTED").getValue();
            ob[7] = itemDesc;

            ttsrm.addRow(ob);
            SwingUtilities.invokeLater(new Runnable() {
                public void run() {
                    fireTreeTableDataChanged();
                }
            });

        } else {
            ScishareLog.warn(this, "item is not a file: ", itemDesc);
        }
    }

    /**
     * A TreeCellRenderer that displays a JTree.
     */
    public class TreeTableCellRenderer extends JTree implements
            TableCellRenderer {
        /** Last table/tree row asked to renderer. */
        protected int visibleRow;

        public TreeTableCellRenderer(TreeModel model) {
            super(model);
        }

        /**
         * updateUI is overridden to set the colors of the Tree's renderer
         * to match that of the table.
         */
        public void updateUI() {
            super.updateUI();
            // Make the tree's cell renderer use the table's cell selection colors.
            TreeCellRenderer tcr = getCellRenderer();
            if (tcr instanceof DefaultTreeCellRenderer) {
                DefaultTreeCellRenderer dtcr = ((DefaultTreeCellRenderer) tcr);
                dtcr.setTextSelectionColor(UIManager.getColor
                        ("Table.selectionForeground"));
                dtcr.setBackgroundSelectionColor(UIManager.getColor
                        ("Table.selectionBackground"));
            }
        }

        /**
         * Sets the row height of the tree, and forwards the row height to
         * the table.
         */
        public void setRowHeight(int rowHeight) {
            if (rowHeight > 0) {
                super.setRowHeight(rowHeight);
                if (TreeTableSearchResponseView.this != null &&
                        TreeTableSearchResponseView.this.getRowHeight() != rowHeight) {
                    TreeTableSearchResponseView.this.setRowHeight(getRowHeight());
                }
            }
        }

        /**
         * This is overridden to set the height to match that of the JTable.
         */
        public void setBounds(int x, int y, int w, int h) {
            super.setBounds(x, 0, w, TreeTableSearchResponseView.this.getHeight());
        }

        /**
         * Sublcassed to translate the graphics such that the last visible
         * row will be drawn at 0,0.
         */
        public void paint(Graphics g) {
            g.translate(0, -visibleRow * getRowHeight());
            super.paint(g);
        }

        /**
         * TreeCellRenderer method. Overridden to update the visible row.
         */
        public Component getTableCellRendererComponent(JTable table,
                                                       Object value,
                                                       boolean isSelected,
                                                       boolean hasFocus,
                                                       int row, int column) {
            if (isSelected)
                setBackground(table.getSelectionBackground());
            else
                setBackground(table.getBackground());
            visibleRow = row;
            return this;
        }
    }


    /**
     * TreeTableCellEditor implementation. Component returned is the JTree.
     */
    public class TreeTableCellEditor extends AbstractCellEditor implements
            TableCellEditor {
        public Component getTableCellEditorComponent(JTable table,
                                                     Object value,
                                                     boolean isSelected,
                                                     int r, int c) {
            return tree;
        }

        /**
         * Overridden to return false, and if the event is a mouse event
         * it is forwarded to the tree.
         * By returning false we are also enforcing the policy that
         * the tree will never be editable (at least by a key sequence).
         */
        public boolean isCellEditable(EventObject e) {
            if (e instanceof MouseEvent) {
                for (int counter = getColumnCount() - 1; counter >= 0;
                     counter--) {
                    if (getColumnClass(counter) == TreeTableModel.class) {
                        MouseEvent me = (MouseEvent) e;
                        MouseEvent newME = new MouseEvent(tree, me.getID(),
                                me.getWhen(), me.getModifiers(),
                                me.getX() - getCellRect(0, counter, true).x,
                                me.getY(), me.getClickCount(),
                                me.isPopupTrigger());
                        tree.dispatchEvent(newME);
                        break;
                    }
                }
            }
            return false;
        }
    }


    /**
     * ListToTreeSelectionModelWrapper extends DefaultTreeSelectionModel
     * to listen for changes in the ListSelectionModel it maintains. Once
     * a change in the ListSelectionModel happens, the paths are updated
     * in the DefaultTreeSelectionModel.
     */
    class ListToTreeSelectionModelWrapper extends DefaultTreeSelectionModel {
        /** Set to true when we are updating the ListSelectionModel. */
        protected boolean updatingListSelectionModel;

        public ListToTreeSelectionModelWrapper() {
            super();
            getListSelectionModel().addListSelectionListener
                    (createListSelectionListener());
        }

        /**
         * Returns the list selection model. ListToTreeSelectionModelWrapper
         * listens for changes to this model and updates the selected paths
         * accordingly.
         */
        ListSelectionModel getListSelectionModel() {
            return listSelectionModel;
        }

        /**
         * This is overridden to set <code>updatingListSelectionModel</code>
         * and message super. This is the only place DefaultTreeSelectionModel
         * alters the ListSelectionModel.
         */
        public void resetRowSelection() {
            if (!updatingListSelectionModel) {
                updatingListSelectionModel = true;
                try {
                    super.resetRowSelection();
                } finally {
                    updatingListSelectionModel = false;
                }
            }
        }
        // Creates and returns an instance of ListSelectionHandler.
        protected ListSelectionListener createListSelectionListener() {
            return new ListSelectionHandler();
        }

        /**
         * If <code>updatingListSelectionModel</code> is false, this will
         * reset the selected paths from the selected rows in the list
         * selection model.
         */
        protected void updateSelectedPathsFromSelectedRows() {
            if (!updatingListSelectionModel) {
                updatingListSelectionModel = true;
                try {
                    // This is way expensive, ListSelectionModel needs an
                    // enumerator for iterating.
                    int min = listSelectionModel.getMinSelectionIndex();
                    int max = listSelectionModel.getMaxSelectionIndex();

                    clearSelection();
                    if (min != -1 && max != -1) {
                        for (int counter = min; counter <= max; counter++) {
                            if (listSelectionModel.isSelectedIndex(counter)) {
                                TreePath selPath = tree.getPathForRow
                                        (counter);
                                TreePath parentPath = selPath.getParentPath();
                                if (isPathSelected(parentPath)) {
                                    listSelectionModel.removeSelectionInterval(counter, counter);
                                    continue;
                                }
                                if (selPath != null) {
                                    addSelectionPath(selPath);
                                }
                            }
                        }
                    }
                } finally {
                    updatingListSelectionModel = false;
                }
            }
        }

        /**
         * Class responsible for calling updateSelectedPathsFromSelectedRows
         * when the selection of the list changse.
         */
        class ListSelectionHandler implements ListSelectionListener {
            public void valueChanged(ListSelectionEvent e) {
                updateSelectedPathsFromSelectedRows();
            }
        }
    }
}
