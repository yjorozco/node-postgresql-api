import Tasks from '../models/Tasks';

export async function createTask(req, res) {

    try {
        const { name, done, projectid } = await req.body;
        const newTask = await Tasks.create({
            name,
            done,
            projectid
        }, {
            fields: ['name', 'done', 'projectid']
        })
        return res.json({
            message: 'new task created',
            data: newTask
        })
    } catch (e) {
        console.log(e);
    }

}

export async function getTasks(req, res) {
    const tasks = await Tasks.findAll({
        attributes: ['id', 'projectid', 'name', 'done'],
        order: [
            ['id', 'DESC']
        ]
    });
    res.json({ tasks });

}

export async function updateTask(req, res) {
    const { id } = await req.params;
    const { projectid, name, done } = req.body;
    const task = await Tasks.findOne({
        attributes: ['name', 'projectid', 'done', 'id'],
        where: {
            id
        }
    })
    const updateTask = await Tasks.update({
        name,
        done,
        projectid
    },
        {
            where: { id }
        })
    return res.json({
        message: "Task Update",
        updateTask
    })
}

export async function deleteTask(req, res) {
    try {
        const { id } = await req.params;
        console.log(id);
        const deleteRowCount = await Tasks.destroy({
            where: {
                id
            }
        })
        return res.json({
            message: "Task Deleted",
            count: deleteRowCount
        });
    } catch (e) {
        console.log(e);
        res.status(500).json({
            message: "Something goes wrong",
            data: {}
        })
    }
}

export async function getOneTask(req, res) {
    try {
        const { id } = await req.params;

        const task = await Tasks.findOne({
            attributes: ['name', 'projectid', 'done', 'id'],
            where: { id }
        });

        return res.json({
            task
        });
    } catch (e) {
        console.log(e);
    }

}

export async function getTaskByProject(req, res) {
    const { projectid } = await req.params;
    const tasks =  await Tasks.findAll({
        attributes: ['id', 'name', 'done'],
        where:{
           projectid
        }
    })
    return res.json({tasks})
}